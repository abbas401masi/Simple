package com.simple.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.simple.model.Product;
import com.simple.model.SubCategory;
import com.simple.service.ProductService;
import com.simple.service.SubCategoryService;
import com.simple.service.impl.ProductServiceImpl;
import com.simple.service.impl.SubCategoryServiceImpl;

@WebServlet("/ManageProductController")
public class ManageProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String UPLOAD_DIRECTORY = "products";
	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	Product product = new Product();
	ProductService productService = new ProductServiceImpl();
	SubCategoryService subCategoryService = new SubCategoryServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String f = request.getParameter("flag");
		if (f.equals("loadSubCategory")) {
			loadSubCategory(request, response);
		}
	}

	private void loadSubCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Long cid = Long.parseLong(request.getParameter("cid"));
		List<SubCategory> subCategories = subCategoryService.findByCategoryId(cid);
		Gson gson = new Gson();
		String sub = gson.toJson(subCategories);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(sub);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			// if not, we stop here
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);
		String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			if (fileItems != null && fileItems.size() > 0) {
				String filePath = null;
				for (FileItem fileItem : fileItems) {
					if (!fileItem.isFormField()) {
						String fileName = new File(fileItem.getName()).getName();
						product.setImage("../" + UPLOAD_DIRECTORY + "/" + fileName);
						filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						fileItem.write(storeFile);
					} else {
						if (fileItem.getFieldName().equals("subCategory")) {
							Long sid = Long.parseLong(fileItem.getString());
							SubCategory subcategory = subCategoryService.findById(sid);
							product.setSubCategory(subcategory);
						}
						if (fileItem.getFieldName().equals("title")) {
							product.setTitle(fileItem.getString());
						}
						if (fileItem.getFieldName().equals("stock")) {
							product.setStock(fileItem.getString());
						}
						if (fileItem.getFieldName().equals("price")) {
							product.setPrice(fileItem.getString());
						}
						if (fileItem.getFieldName().equals("desc")) {
							product.setDescription(fileItem.getString());
						}
					}
				}
			}
			productService.insert(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin/products.jsp");
	}

}
