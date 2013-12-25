//
// Εργασία Αριθμητικής Ανάλυσης
// Χριστοπούλου Μαρία
// Α.Μ : 200600237
//
//
// Άσκηση 4 - Επίλυση Διαφορικής Εξίσωσης με τις μεθόδους Euler και Runge Kutta 4ης τάξης

function [Yeu,Yrk]= eulerrk

    a = 1;
    b = 10;
    // Βήμα
    h = 0.01;
    n = round((b-a)/h);
    y0 = 0;
    t0 = 1;
    // Αρχικοποίηση Μεταβλητών
    Yeu = zeros(1,n+1);
    T = zeros(1,n+1);
    // Αρχικές Συνθήκες
    t = t0;
    y = y0
    Y(1) = y;
    T(1) = t;
    // Μέθοδος Euler
    for i=1:n
        k = h*f(t,y);
        y = y + k;
        t = t + h;
        T(i+1) = t;
        Yeu(i+1) = y;
    end
    //
        // Αρχικοποίηση Μεταβλητών
    Yrk = zeros(1,n+1);
    T = zeros(1,n+1);
    // Αρχικές Συνθήκες
    Yrk(1) = y0;
    T(1) = t0;
    t = t0;
    y = y0;
    for i=1:n
        f1 = h*f(t,y);
        f2 = h*f(t+h/2,y+h*f1/2);
        f3 = h*f(t+h/2,y+h*f2/2);
        f4 = h*f(t+h,y+f3);
        y= y + (f1+2*f2+2*f3+f4)/6;
        t = t + h;
        T(i+1) = t;
        Yrk(i+1) = y;
    end
        // Εφόσον δεν υπάρχει ακριβής λύση της διαφορικής,
        // Βρίσκουμε το σχετικό σφάλμα της Euler από τη Rk4.
        err=zeros(1,length(Yrk)-1);
        for i=2:length(Yrk)
            err(i) = abs((Yeu(i)-Yrk(i))/Yrk(i));
        end
    // Γραφικές Παραστάσεις
    scf(1)

    N = T./h -1;
    plot(T,Yeu,'r')
    plot(T,Yrk,'b')
    scf(2)
    plot(N,err,'r')

    
   
endfunction
