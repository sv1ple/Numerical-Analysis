//
// Εργασία Αριθμητικής Ανάλυσης
// Χριστοπούλου Μαρία
// Α.Μ : 200600237
//
// Άσκηση 3β - Αριθμητική ολοκλήρωση με τις μεθόδους Simpsons 1/3 kai 3/8
// 
function simpsons
    
     A = read("200600237.DAT",-1,2);
    area1 = 0;
    x = A(:,1);
    y = A(:,2);
    
        // Calculate average step
    for i = 1:length(x)-1
        step(i) = x(i+1)-x(i);
    end
    h = sum(step)/(length(x)-1);
    disp(h)
    // Simpsons 1/3
    s0=0;
    s1=0;
    s2=0;
    for i=1:2:length(x)-1
        s0 = s0+y(i);
        s1 = s1+y(i+1);
        s2 = s2 + y(i+2);
    end
    area1 = (h/3)*(s0+4*s1+s2)
    
    // Simpsons 3/8
    s0 =0;
    s1=0;
    s2=0;
    s3=0;
    area2=0;
    for i =1:3:length(x)-1
        s0 = s0 + y(i);
        s1 = s1+ y(i+1);
        s2 = s2 + y(i+2);
        s3 = s3 + y(i+3);
    end
    area2 = (3*h/8)*(s0 + 3*s1 + 3*s2 + s3);

    disp(area1)
    disp(area2)

endfunction
