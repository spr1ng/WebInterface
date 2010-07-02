/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.theeye.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.tomcat.util.http.fileupload.DiskFileUpload;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import eye.ImageFactory;
import eye.models.Point;
import java.awt.Color;


/**
 *
 * @author spr1ng
 */
public class SearchController extends AbstractController {

    /** Максимальный размер загружаемого файла */
    private static final int MAX_FILE_SIZE = 3; // MB
    private static final Logger LOG = Logger.getLogger(SearchController.class);
    private static final ModelAndView ERR_MV = new ModelAndView("index");
    private static final ModelAndView SUC_MV = new ModelAndView("searchResult");
    private static String contentType;

    protected ModelAndView handleRequestInternal(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        DiskFileUpload fu = new DiskFileUpload();
    // If file size exceeds, a FileUploadException will be thrown
        fu.setSizeMax(MAX_FILE_SIZE * 1024 * 1024);
        List fileItems = null;
        try {
            fileItems = fu.parseRequest(request);
        } catch (FileUploadException e) {
            return ERR_MV.addObject("fileError", "The image must be less than " + MAX_FILE_SIZE + " mb.");
        }

    //If file not selected..
        FileItem fileItem = getFileItem(fileItems);
        if (fileItem == null)
            return ERR_MV.addObject("fileError", "Select the image first!");
        LOG.info("TYPE: " + fileItem.getContentType());

    //If not an image..
        contentType = fileItem.getContentType();
        LOG.info("Content type: " + contentType); //DELME: 
        if (!contentType.contains("image"))
            return ERR_MV.addObject("fileError", "The file must be an image!");

    //Changing response type..
        response.setContentType(contentType);

    //Preparing image data..
        String fileName = fileItem.getName();
        long fileSize = fileItem.getSize();

    //Raising eye service..
        InputStream in = fileItem.getInputStream();
        OutputStream out = response.getOutputStream();

        ImageFactory factory = new ImageFactory();
        List<Point> points = factory.seekPoints(in);
        factory.draw(points, Color.BLACK);
        factory.saveToOutputStream(ImageFactory.getExtension(fileName), out);

        return SUC_MV;
    }

    /**
     * Возвращает валидный FileItem иначе null
     * @param fileItems
     * @return
     */
    private FileItem getFileItem(List fileItems){
        Iterator itr = fileItems.iterator();
        while (itr.hasNext()) {
            FileItem fi = (FileItem) itr.next();
            //Check if not form field so as to only handle the file inputs
            //else condition handles the submit button input
            if (!fi.isFormField()) {
                if (fi.getContentType() != null && fi.getSize() != 0)
                    return fi;
            }
        }
        return null;
    }

}
