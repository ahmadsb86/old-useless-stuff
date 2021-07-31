class data {

  int scout = 0;
  int mobilityCap = 0;
  int cost = 0;
  int armour = 0;
  int acircle = 0;
  int asquare = 0;
  int atriangle = 0;
  int astructure = 0;



  void setp(int s, int m, int c, int a, int ac, int as, int at, int ab) {
    scout = s;
    mobilityCap = m;
    cost = c;
    armour = a;
    acircle = ac;
    astructure = ab;
    asquare = as;
    atriangle = at;
  }

  void boostData(data d) {
    scout += d.scout;
    mobilityCap += d.mobilityCap;
    cost += d.cost;
    armour += d.armour;
    acircle += d.acircle;
    asquare += d.asquare;
    atriangle += d.atriangle;
    astructure += d.astructure;
  }
}
