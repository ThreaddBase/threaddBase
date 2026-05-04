package com.util;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.http.Part;

public class ImageUtil {

    public String getImageNameFromPart(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        String imageName = null;

        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                imageName = s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }

        if (imageName == null || imageName.isEmpty()) {
            imageName = "download.png";
        }

        return imageName;
    }

    public String getSavePath(String rootPath, String saveFolder) {
        return rootPath + File.separator + saveFolder;
    }

    /**
     * Uploads the image and returns the saved filename (with timestamp),
     * or null if upload failed.
     */
    public String uploadImage(Part part, String rootPath, String saveFolder) {
        String savePath = getSavePath(rootPath, saveFolder);
        File fileSaveDir = new File(savePath);

        if (!fileSaveDir.exists()) {
            if (!fileSaveDir.mkdirs()) {  // fixed: mkdirs() instead of mkdir()
                System.out.println("Failed to create directory: " + savePath);
                return null;
            }
        }

        try {
            // Generate filename once here — used for both saving and returning
            String imageName = System.currentTimeMillis() + "_" + getImageNameFromPart(part);
            String filePath = savePath + File.separator + imageName;
            part.write(filePath);
            System.out.println("Image saved to: " + filePath);
            return imageName; // return the name so caller can build the path
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}