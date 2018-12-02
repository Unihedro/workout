import java.util.*;
import java.util.stream.*;

public class Main {

    public static void main (String[] args) {
        Scanner s = new Scanner(System.in);
        Collection<char[]> all = new ArrayList<>();
        while (s.hasNextLine()) {
            String line = s.nextLine();
            char[] current = line.toCharArray();
            Optional<char[]> find = all.stream().filter((elem) -> {
                boolean miss = false;
                for (int i = 0; i < current.length; i++)
                    if (current[i] != elem[i])
                        if (miss) return false; else miss = true;
                return miss;
            }).findAny();
            if (find.isPresent()) {
                System.out.println(find.get());
                System.out.println(line);
            }
            all.add(current);
        }
    }

}
