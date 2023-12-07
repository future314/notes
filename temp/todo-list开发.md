1. 参考shiro项目  
   https://juejin.cn/post/6844903823966732302


```java
public class Main {
    public static void main(String[] args) throws IOException {
        String msg = "abcefg\nadaadfad\nadfa";
        byte[] byteArray = msg.getBytes();
        InputStream inputStream = new ByteArrayInputStream(byteArray);
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
        StringBuilder stringBuilder = new StringBuilder();
        int count = 0;
        char[] charBuf = new char[1024];
        while ((count = inputStreamReader.read(charBuf)) > 0) {
            stringBuilder.append(charBuf, 0, count);
        }
        System.out.println(stringBuilder.toString());
    }
}
```