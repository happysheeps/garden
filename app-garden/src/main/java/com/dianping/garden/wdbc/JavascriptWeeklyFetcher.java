package com.dianping.garden.wdbc;

import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.dianping.garden.dal.Article;
import com.dianping.garden.dal.Trend;
import org.unidal.webres.helper.Scanners;
import org.unidal.webres.helper.Scanners.UrlMatcher;
import org.unidal.lookup.annotation.Inject;
import org.unidal.lookup.configuration.Component;
import org.unidal.wdbc.WdbcSource;
import org.unidal.wdbc.http.configuration.AbstractWdbcComponentsConfigurator;

public class JavascriptWeeklyFetcher implements ArticleFetcher {
   @Inject
   private WdbcMapping m_wdbcMapping;

   @Override
   public List<Component> defineComponents() {
      return new AbstractWdbcComponentsConfigurator() {
         @Override
         public List<Component> defineComponents() {
            List<Component> all = new ArrayList<Component>();

            all.add(C(ArticleFetcher.class, getId(), JavascriptWeeklyFetcher.class).req(WdbcMapping.class));
            all.addAll(WDBC(JavascriptWeekly.class));
            return all;
         }
      }.defineComponents();
   }

   @Override
   public List<Article> getArticles(Trend trend, String url, WdbcSource source) throws Exception {
      List<Article> articles = new ArrayList<Article>();

      List<JavascriptWeekly> result = m_wdbcMapping.apply(JavascriptWeekly.class, source);

      for (JavascriptWeekly item : result) {
         Article article = new Article();

         article.setSourceType("trend");
         article.setSourceId(trend.getId());
         article.setTitle(item.getTitle());
         article.setOriginLink(item.getLink());
         article.setAbstraction(item.getText());
         article.setTags("javascript");
         article.setPublishDate(item.getDate());
         articles.add(article);
      }

      return articles;
   }

   @Override
   public String getId() {
      return "javascript";
   }

   @Override
   public List<URL> getIssueList(URL baseUrl, Date lastFetchDate) throws Exception {
      return Scanners.forUrl().scan(baseUrl, new ApacheDirectoryProvider(), new UrlMatcher() {
         @Override
         public Direction matches(URL base, String path) {
            return Direction.MATCHED;
         }
      });
   }
}
