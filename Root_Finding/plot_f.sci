//
// Εργασία Αριθμητικής Ανάλυσης
// Χριστοπούλου Μαρία
// Α.Μ : 200600237
//
// Άσκηση 1 - Επίλυση Εξίσωσης με τη μέθοδο της διχοτόμησης
//
// Γραφική Παράσταση Συναρτησης

function plot_f
    
    clf(); // Clear figure
    x =[-5:0.1:5]';
    y = x.^5-5.*x.^3+9.*x-6;
    plot(x,y,'r-');
    set(gca(),"grid",[0,0])
    a = gca();
    a.x_location = "origin";
    a.y_location = "origin";
    set(gca(),"data_bounds",matrix([-5,6,-10,10],2,-1))
    xtitle('$x$','$y$')
    title('$f(x) = x^5-5x^3+9x-6$','fontsize',4,'color','black')
endfunction
