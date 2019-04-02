package com.jplus.service.impl;

import base.SpringTestBase;
import com.jplus.service.NewsService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class NewsServiceImplTest extends SpringTestBase{
    @Autowired
    private NewsService newsService;
    @Test
    public void batchDeleteNews() throws Exception {
        int newsId[]={1,2};
        newsService.batchDeleteNews(newsId);
    }



}
