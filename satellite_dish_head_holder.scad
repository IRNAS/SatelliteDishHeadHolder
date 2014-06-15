
d_luknje = 41; //premer luknje za glavo
l_luknje = 47; //oddaljenost luknje za glavo od posevnega cepa
kot = 35; //kot posevnega cepa od navpicnice
b_cepa = 26; //sirina cepa
t_cepa = 12; //debelina cepa
l_cepa = 40; //dolzina cepa
d_aluminij = 2; //debelina aluminijastega ohisja, kamor je pritrjen celoten nosilec
del = 0; //del=1 za prvi kos nosilca, del=2 za drugi kos nosilca, del=0 za oba kosa



difference () {
	union () {
		difference() {
			union () {

				// glavni del nosilca okoli glave - dodano
				cylinder(20,r=d_luknje/2+10,center=true); //obroc okoli glave
				translate([0,-b_cepa/2-d_aluminij,-10]) cube([l_luknje+t_cepa*cos(kot),b_cepa+2*d_aluminij,20]); //kvader kot podaljsek obroca
				rotate([0,0,90]) translate([-5,d_luknje/2+5,-10]) cube([10,10+5,20]); //strcelj za vijak
				translate([0,-(d_luknje/2+10)*(20+b_cepa/2+d_aluminij)/(20+d_luknje/2+10),-10]) cube([sqrt((20+d_luknje/2+10)*(20+d_luknje/2+10)-(20+b_cepa/2+d_aluminij)*(20+b_cepa/2+d_aluminij)),2*(d_luknje/2+10)*(20+b_cepa/2+d_aluminij)/(20+d_luknje/2+10),20]); //okroglini pri cepu
				translate([-(d_luknje/2+20),0,-10]) cube([((-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)*(20+d_luknje/2))/(4*(-20+b_cepa+2*d_aluminij-d_luknje)*(10+((-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)/(4*(-20+b_cepa+2*d_aluminij-d_luknje)))+d_luknje/2)),b_cepa/2+d_aluminij+(-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)/(4*(-20+b_cepa+2*d_aluminij-d_luknje))-(b_cepa/2+d_aluminij+(-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)/(4*(-20+b_cepa+2*d_aluminij-d_luknje)))*(-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)/((4*(-20+b_cepa+2*d_aluminij-d_luknje))*(10+(-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)/(4*(-20+b_cepa+2*d_aluminij-d_luknje))+d_luknje/2)),20]); //okroglina pri strclju za vijak

				}

			// glavni del nosilca okoli glave - odvzeto
			cylinder(30,r=d_luknje/2,center=true); //luknja za glavo
			translate([sqrt((20+d_luknje/2+10)*(20+d_luknje/2+10)-(20+b_cepa/2+d_aluminij)*(20+b_cepa/2+d_aluminij)),20+b_cepa/2+d_aluminij,0]) cylinder(30,r=20,center=true); //okroglina pri cepu levo
			translate([sqrt((20+d_luknje/2+10)*(20+d_luknje/2+10)-(20+b_cepa/2+d_aluminij)*(20+b_cepa/2+d_aluminij)),-20-b_cepa/2-d_aluminij,0]) cylinder(30,r=20,center=true); //okroglina pri cepu desno
			translate([-(d_luknje/2+20),b_cepa/2+d_aluminij+(-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)/(4*(-20+b_cepa+2*d_aluminij-d_luknje)),0]) cylinder(30,r=(-1200-b_cepa*b_cepa-4*b_cepa*d_aluminij-4*d_aluminij*d_aluminij-40*d_luknje)/(4*(-20+b_cepa+2*d_aluminij-d_luknje)),center=true); //okroglina pri strclju za vijak

			// posevnina za cep za pritrditev nosilca glave na kroznik
			translate([l_luknje+t_cepa*cos(kot),b_cepa/2+d_aluminij+5,-10+t_cepa*sin(kot)]) rotate([180,90-kot,0]) cube([100,b_cepa+2*d_aluminij+10,t_cepa]); //odrezana posevnina za cep

			// vijaki za spojitev obeh delov
			translate([-(d_luknje/2+15),b_cepa/2+d_aluminij-4+25,0]) rotate([90,0,0]) linear_extrude(height = 50, center = true, convexity = 10, twist = 0) polygon(points=[[0,3.5/cos(30)],[3.5,3.5*tan(30)],[3.5,-3.5*tan(30)],[0,-3.5/cos(30)],[-3.5,-3.5*tan(30)],[-3.5,3.5*tan(30)]], paths=[[0,1,2,3,4,5]]); //luknja za matico za spojitev obeh delov
			translate([-(d_luknje/2+15),b_cepa/2+d_aluminij-4+10,0]) rotate([90,0,0]) cylinder(200,r=2.3,center=true); //luknja za vijak za spojitev obeh delov
			translate([d_luknje/2+10+0.5*(l_luknje-d_luknje/2-10),b_cepa/2+d_aluminij-4+25,-4]) rotate([90,0,0]) linear_extrude(height = 50, center = true, convexity = 10, twist = 0) polygon(points=[[0,3.5/cos(30)],[3.5,3.5*tan(30)],[3.5,-3.5*tan(30)],[0,-3.5/cos(30)],[-3.5,-3.5*tan(30)],[-3.5,3.5*tan(30)]], paths=[[0,1,2,3,4,5]]); //luknja za matico za spojitev obeh delov
			translate([d_luknje/2+10+0.5*(l_luknje-d_luknje/2-10),b_cepa/2+d_aluminij-4+10,-4]) rotate([90,0,0]) cylinder(200,r=2.3,center=true); //luknja za vijak za spojitev obeh delov
			translate([d_luknje/2+10+0.5*(l_luknje-d_luknje/2-10),-(b_cepa/2+d_aluminij-4.5+25),-4]) rotate([90,0,0]) cylinder(50,r=4,center=true); //luknja za glavo za vijak za spojitev obeh delov

			// vijaki za ojacitev spodaj
			translate([(l_luknje+t_cepa*cos(kot)+10)/2,b_cepa/2+d_aluminij-4.5,6.5]) rotate([0,90,0]) cylinder(l_luknje+t_cepa*cos(kot)+10,r=1.3,center=true); //luknja za vijak za ojacitev spodaj levo
		translate([l_luknje+t_cepa*cos(kot)+25-3.5,b_cepa/2+d_aluminij-4.5,6.5]) rotate([0,90,0]) cylinder(50,r=3,center=true); //luknja za glavo za vijak za ojacitev spodaj levo
		translate([(l_luknje+t_cepa*cos(kot)+10)/2,-(b_cepa/2+d_aluminij-4.5),6.5]) rotate([0,90,0]) cylinder(l_luknje+t_cepa*cos(kot)+10,r=1.3,center=true); //luknja za vijak za ojacitev spodaj desno
		translate([l_luknje+t_cepa*cos(kot)+25-3.5,-(b_cepa/2+d_aluminij-4.5),6.5]) rotate([0,90,0]) cylinder(50,r=3,center=true); //luknja za glavo za vijak za ojacitev spodaj desno

			}

		// cep za pritrditev nosilca glave na kroznik (posevni del)
		translate([l_luknje+t_cepa*cos(kot),b_cepa/2,-10+t_cepa*sin(kot)]) rotate([180,90-kot,0]) cube([l_cepa,b_cepa,t_cepa]); //cep za pritrditev nosilca glave na kroznik z dodatkom kvadra

	}

	// vijaki za ojacitev posevno
	translate([l_luknje+t_cepa/2/cos(kot),(b_cepa-0.5)/4+0.5,-10]) rotate([0,-kot,0]) cylinder(4*l_cepa,r=1.3,center=true); //luknja za vijak za ojacitev posevno levo
	translate([l_luknje+t_cepa/2/cos(kot),(b_cepa-0.5)/4+0.5,-10]) rotate([0,-kot,0]) translate([0,0,-(-t_cepa/2*tan(kot)+l_cepa+25-3.5)]) cylinder(50,r=3,center=true); //luknja za glavo za vijak za ojacitev posevno levo
	translate([l_luknje+t_cepa/2/cos(kot),-((b_cepa-0.5)/4+0.5),-10]) rotate([0,-kot,0]) cylinder(4*l_cepa,r=1.3,center=true); //luknja za vijak za ojacitev posevno desno
	translate([l_luknje+t_cepa/2/cos(kot),-((b_cepa-0.5)/4+0.5),-10]) rotate([0,-kot,0]) translate([0,0,-(-t_cepa/2*tan(kot)+l_cepa+25-3.5)]) cylinder(50,r=3,center=true); //luknja za glavo za vijak za ojacitev posevno desno

	// luknja za pritrditev nosilca glave
	translate([l_luknje,0,-10]) rotate([0,90-kot,0]) translate([35,0,0]) cylinder(500,r=1.5,center=true); //luknja na posevnem delu za pritrditev nosilca glave z vijakom na kroznik z odvzemom valja

	// posnetje luknje za glavo
	translate([0,0,-7.5]) cylinder(h=15,r1=d_luknje/2+6,r2=d_luknje/2-9,center=true); //posnetje luknje za glavo s fazo 1/45° z odvzemom stozca

	// reza po sredini
	cube([500,1,500],center=true); //reza po sredini nosilca z odvzemom kvadra

	// razrez na pol
	if (del==1) {
	translate([0,250,0]) cube([500,500,500],center=true);
	} else if (del==2) {
	translate([0,-250,0]) cube([500,500,500],center=true);
	} else {
	} //razrez na pol, ce je del==1 potem je prvi kos, ce je del==2 potem je drugi kos

}