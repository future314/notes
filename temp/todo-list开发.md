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


```python
from java.io import ByteArrayInputStream
from java.io import InputStream
from java.io import InputStreamReader
from java.lang import String
from java.lang import StringBuilder
from array import array

byteArray = "Hello, Jython!".encode('utf-8')
inputStream = ByteArrayInputStream(byteArray)
inputStreamReader = InputStreamReader(inputStream)

stringBuilder = StringBuilder("ab")

charBuf = array('c', [' '] * 1024)
count = inputStreamReader.read(charBuf)
while count > 0:
    stringBuilder.append(charBuf, 0, count)
    count = inputStreamReader.read(charBuf)

print(stringBuilder.toString())

```