package postUpdateDeletePet;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class PostUpdateDeletePet {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:postUpdateDeletePet").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}