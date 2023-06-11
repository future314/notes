### jetty服务端开启双向认证

1. SslContextFactory配置

   ```java
   import java.io.File;
   import java.io.FileNotFoundException;
   
   import org.eclipse.jetty.http.HttpVersion;
   import org.eclipse.jetty.io.ssl.SslHandshakeListener;
   import org.eclipse.jetty.server.Connector;
   import org.eclipse.jetty.server.HttpConfiguration;
   import org.eclipse.jetty.server.HttpConnectionFactory;
   import org.eclipse.jetty.server.SecureRequestCustomizer;
   import org.eclipse.jetty.server.Server;
   import org.eclipse.jetty.server.ServerConnector;
   import org.eclipse.jetty.server.SslConnectionFactory;
   import org.eclipse.jetty.util.ssl.SslContextFactory;
   
   /**
    * 一个有多个连接的Jetty例子
    */
   public class ManyConnectors {
       public static void main(String[] args) throws Exception {
   
           //创建一个不指定端口的Server，随后将直接配置连接和端口
           Server server = new Server();
           
           //HTTP配置
           //HttpConfiguration是一个配置http和https属性的集合，默认的配置是http的
           //带secured的ui配置https的，
           HttpConfiguration http_config = new HttpConfiguration();
           http_config.setSecureScheme("https");
           http_config.setSecurePort(8443);
           http_config.setOutputBufferSize(32768);
           
           //HTTP连接
           //第一个创建的连接是http连接，传入刚才创建的配置信息，也可以重新设置新的配置，如端口，超时等
           ServerConnector http = new ServerConnector(server, new HttpConnectionFactory(http_config));
           http.setPort(8080);
           http.setIdleTimeout(30000);
   
           //使用SslContextFactory来创建http
           //SSL需要一个证书，所以我们配置一个工厂来获得需要的东西
           SslContextFactory sslContextFactory = new SslContextFactory();
           sslContextFactory.setKeyStorePath("D:\\install\\OpenSSL\\bin\\ssl\\server.jks");
           sslContextFactory.setKeyStorePassword("future@123");
           sslContextFactory.setKeyManagerPassword("future@123");
           sslContextFactory.setTrustStorePath("D:\\install\\OpenSSL\\bin\\ssl\\server.jks");
           sslContextFactory.setNeedClientAuth(true);
           //sslContextFactory.setValidatePeerCerts(true);
           //sslContextFactory.setValidateCerts(true);
           //sslContextFactory.setCrlPath("D:\\install\\OpenSSL\\bin\\ssl\\ca.crl");
           sslContextFactory.setEndpointIdentificationAlgorithm("HTTPS");
   
   
   
           //HTTPS的配置类
           HttpConfiguration https_config = new HttpConfiguration(http_config);
           SecureRequestCustomizer src = new SecureRequestCustomizer();
           src.setStsMaxAge(2000);
           src.setStsIncludeSubDomains(true);
           https_config.addCustomizer(src);
   
           //HTTPS连接
           //创建第二个连接，
           ServerConnector https = new ServerConnector(server,
                   new SslConnectionFactory(sslContextFactory, HttpVersion.HTTP_1_1.asString()),
                   new HttpConnectionFactory(https_config));
           https.setPort(8443);
           https.setHost("192.168.2.77");
           https.setIdleTimeout(500000);
           SslHandshakeListener sslHandshakeListener = new MySslHandshakeListener ();
           https.addBean(sslHandshakeListener);
   
           // 设置一个连接的集合
           server.setConnectors(new Connector[] { http, https });
   
           // 设置一个处理器
           server.setHandler(new HelloWorldHandle());
   
           // 启动服务
           server.start();
           server.join();
       }
   }
   ```

2. Handle

   ```java
   import org.eclipse.jetty.server.Request;
   import org.eclipse.jetty.server.handler.AbstractHandler;
   
   import javax.servlet.ServletException;
   import javax.servlet.http.HttpServletRequest;
   import javax.servlet.http.HttpServletResponse;
   import java.io.IOException;
   import java.io.PrintWriter;
   
   
   /**
    * @author saligia
    * @date 17-10-10
    */
   public class HelloWorldHandle extends AbstractHandler {
   
       /**
        *
        * @param target              - 目标请求，可以是一个URI或者是一个转发到这的处理器的名字
        * @param request             - Jetty自己的没有被包装的请求，一个可变的Jetty请求对象
        * @param httpServletRequest  - 被filter或者servlet包装的请求，一个不可变的Jetty请求对象
        * @param httpServletResponse - 响应，可能被filter或者servlet包装过
        * @return
        * @author
        */
       @Override
       public void handle(String target, Request request, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException, ServletException {
           System.out.println("target  :" + target);
           System.out.println("request : " + request.getRequestURI());
           System.out.println("requestServ : " + httpServletRequest.getRequestURI());
   
   
           httpServletResponse.setContentType("text/html; charset=utf-8");
           httpServletResponse.setStatus(HttpServletResponse.SC_OK);
   
           PrintWriter out = httpServletResponse.getWriter();
   
           out.println("<h1>Hello world</hello>");
           request.setHandled(true);
       }
   }
   
   ```

3. SslHandshakeListener

   ```java
   import org.eclipse.jetty.io.ssl.SslHandshakeListener;
   
   import javax.net.ssl.SSLException;
   import javax.net.ssl.SSLPeerUnverifiedException;
   import java.awt.*;
   import java.util.Arrays;
   
   public class MySslHandshakeListener implements SslHandshakeListener {
   
       @Override
       public void handshakeSucceeded(Event event) {
           System.out.println("Certificates is authenticated successful!");
           try {
               Arrays.stream(event.getSSLEngine().getSession().getPeerCertificateChain()).forEach(x509Certificate -> {
                           System.out.printf(x509Certificate.getSubjectDN().toString());
                       });
           } catch (SSLPeerUnverifiedException e) {
               e.printStackTrace();
           }
       }
   
       @Override
       public void handshakeFailed(Event event, Throwable failure) {
           failure.printStackTrace();
       }
   }
   ```

   