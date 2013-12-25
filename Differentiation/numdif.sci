//
// Εργασία Αριθμητικής Ανάλυσης
// Χριστοπούλου Μαρία
// Α.Μ : 200600237
//
// Άσκηση 3α - Αριθμητική Παραγώγιση 3,5 και 7 σημείων
//
function numdif
    // Αριθμητική Παραγώγιση 3,5 και 7 σημείων
    //
    // Δεδομένα
    //    Το αρχείο 200600237.dat
    // 
    // Παράμετροι Συνάρτησης
    //    slope3,slope5,slope7 : οι παράγωγοι 3,5 και 7 σημείων, υπολογισμένες σε κάθε σημείο του αρχείου .dat
    //
    // Περιγραφή συνάρτησης
    //    Η συνάρτηση υπολογίζει την παράγωγο σε κάθε σημείο x0 του αρχείου 200600237.dat.
    //    Για τον υπολογισμό της παραγώγου 3 σημείων χρησιμοποιείται ο τύπος f'(x0) = (f(x0+h)-f(x0-h))/2h
    //    Για τον υπολογισμό της παραγώγου 5 σημείων χρησιμοποιείται ο τύπος f'(x0) = (f(x0-2h)-8*f(x0-h)+8*f(x0+h)-f(x0+2h))/12h
    //    Για τον υπολογισμό της παραγώγου 7 σημείων χρησιμοποιείται ο τύπος f'(x0) = (-f(xo-3h)+9*f(x0-3h)-45*f(x0-h)+45*f(x0+h)-9*f(x0+2h)+f(xo+3h))/60h
    //
    // Αναφορές
    //    Σημειώσεις Υπολογιστικών Μεθόδων
    //
    
    
    // 3point mid point formula
    A = read("200600237.DAT",-1,2);
    
    x = A(:,1);
    y = A(:,2);
    
    // Calculate step
    for i = 1:length(x)-1
        step(i) = x(i+1)-x(i);
    end
    h = sum(step)/(length(x)-1);
    
   
    // 3 point 
    mprintf("\n\nx\tSlope32 Endpoint\n")
    slope3 = zeros(1,length(x)-2);
    for i =2:length(x)-1
        j=i-1;
        slope3(j) = (1/2*h)*(y(i+1)-y(i-1));
        mprintf("\n%f\t%f",x(j),slope3(j))
    end
    
    
    // 5 point formula
    slope5 = zeros(1,length(x)-4);
    disp(size(slope5))
    mprintf("\n5 point formula\n")
    for i =3:length(x)-2
        j = i-2;
        slope5(j) = (1/12*h)*(y(i-2)-8*y(i-1)+8*y(i+1)-y(i+2))
        mprintf("%f\t%f\n",x(j),slope5(j))
    end
    
    
    // 7 point formula
    slope7 = zeros(1,length(x)-6);
    mprintf("\n\nx\tSlope7\n");
    for i =4:length(x)-3
        j=i-3;
        slope7(j) = (1/60*h)*(y(i+3)-9*y(i+2)+45*y(i+1)-45*y(i-1)+9*y(i-2)-y(i-3));
        mprintf("%f\t%f\n",x(j),slope7(j));
    end
    
    // Plot
    scf(1);
    plot(x,y,'bo')
    set(gca(),"grid",[0,0])
    scf(2)
    plot(x(2:600,1),slope3,'bo')
        set(gca(),"grid",[0,0])
    title('3 point formula')
    scf(3)
    plot(x(3:599,1),slope5,'bo')
        set(gca(),"grid",[0,0])
    title('5 point formula')
    scf(4)
    plot(x(4:598,1),slope7,'bo')
        set(gca(),"grid",[0,0])
    title('7 point formula')
endfunction
