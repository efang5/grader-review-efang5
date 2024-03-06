import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test(timeout = 500)
  public void testFilter() {
    List<String> s1 = Arrays.asList("moon", "b", "moon");
    List<String> s2 = Arrays.asList("moon", "b");
    List<String> result1 = ListExamples.filter(s1, new IsMoon());
    List<String> result2 = ListExamples.filter(s2, new IsMoon()); 

    assertEquals(2, result1.size());
    assertEquals(1, result2.size());
    assertEquals(false, result1 == result2);
  }
}
