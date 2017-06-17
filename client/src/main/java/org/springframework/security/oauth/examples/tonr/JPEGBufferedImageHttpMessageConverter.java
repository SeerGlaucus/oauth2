package org.springframework.security.oauth.examples.tonr;

import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.BufferedImageHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotWritableException;

import java.awt.image.BufferedImage;
import java.io.IOException;

/****************************************
 *
 * Created by liyang 
  
 * Email liyangs@yonyou.com
 *
 * Time 2017/6/16
 *
 * Info: 
 *
****************************************/
public class JPEGBufferedImageHttpMessageConverter extends BufferedImageHttpMessageConverter {

    @Override
    public void write(BufferedImage image, MediaType contentType, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        super.write(image, new MediaType("image", "jpeg"), outputMessage);
    }
}
