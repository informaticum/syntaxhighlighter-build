# SyntaxHighlighter v3.0.90

[SyntaxHighlighter](https://github.com/syntaxhighlighter/syntaxhighlighter) is a fully functional self-contained code syntax highlighter developed in JavaScript.
It is developed and maintained by [Alex Gorbatchev](https://github.com/alexgorbatchev), and is dual licensed under the MIT and GPLv2 licenses.

This project builds SyntaxHighlighter from the sources ([v3.0.90](https://github.com/syntaxhighlighter/syntaxhighlighter/tree/v3.0.90)) and -- packaged into a JAR (Java Archive) file -- publishes the result into the Maven Central Repository.

## Inject SyntaxHighlighter into JavaDoc 

In result, it becomes really easy to use Java-brushed syntax highlighting for Javadoc code snippets.

Just tag those snippets like [this J8Unit4 example](https://github.com/j8unit-team/j8unit/blob/master/core/src/main/java/org/j8unit/runners/J8Unit4.java) ...

```java
/**
 * [...]
 *
 * To invoke the default J8Unit {@linkplain org.junit.runner.Runner runner} just use the {@link org.junit.runner.RunWith &#64;RunWith} annotation:
 *
 * <pre class="brush:java">
 * &#064;RunWith(J8Unit4.class)
 * public class FoobarTest {
 *     [...]
 * }
 * </pre>
 * [...]
 */
public final class J8Unit4
extends J8BlockJUnit4ClassRunner {
    [...]
}
```

... and include the required files by configuring the maven-javadoc-plugin in the [project's POM file](https://github.com/j8unit-team/j8unit/blob/master/core/pom.xml).

```xml
<build>
  <plugins>
    [...]
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-javadoc-plugin</artifactId>
      <version>2.10.4</version>
      <configuration>
        [...]
        <resourcesArtifacts>
          <resourcesArtifact>
            <groupId>de.informaticum</groupId>
            <artifactId>syntaxhighlighter</artifactId>
            <version>3.0.90</version>
          </resourcesArtifact>
        </resourcesArtifacts>
        <additionalJOptions>
          <additionalJOption>--allow-script-in-comments</additionalJOption>
        </additionalJOptions>
        <!-- Add SyntaxHighlighter (Java brushing) features (at the beginning of each JavaDoc HTML file). -->
        <top><![CDATA[
          <script src="{@docRoot}/syntaxhighlighter/3.0.90/scripts/shCore.min.js" type="text/javascript"></script>
          <script src="{@docRoot}/syntaxhighlighter/3.0.90/scripts/shBrushJava.js" type="text/javascript"></script>
          <link href="{@docRoot}/syntaxhighlighter/3.0.90/styles/shCore.css" rel="stylesheet" type="text/css" />
          <link href="{@docRoot}/syntaxhighlighter/3.0.90/styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
        ]]>
        </top>
        <!-- Activate and customize SyntaxHighlighter features (at the bottom of each JavaDoc HTML file). -->
        <footer><![CDATA[
          <script type="text/javascript">
            SyntaxHighlighter.defaults["auto-links"] = false;
            SyntaxHighlighter.defaults["tab-size"] = 2;
            SyntaxHighlighter.all();
          </script>
        ]]></footer>
      </configuration>
    </plugin>
  </plugins>
</build>
```
