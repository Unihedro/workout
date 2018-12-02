import java.util.*;
import java.util.stream.*;

public class Main {

    public static void main (String[] args) {
        Scanner s = new Scanner(System.in);
        int count2 = 0, count3 = 0;
        while (s.hasNextLine()) {
            boolean check2 = true, check3 = true;
            for (int value : IntStream counts = s.nextLine().chars().collect(HashMap::new, (map, elem) -> map.put(elem, map.getOrDefault(elem, 0)), HashMap::putAll).values())
                if (check2 && value == 2) {
                    count2++;
                    if (!check3) break;
                    check2 = false;
                }
                else if (check3 && value == 3) {
                    count3++;
                    if (!check2) break;
                    check3 = false;
                }
        }
        System.out.println(count2 * count3);
    }

}
