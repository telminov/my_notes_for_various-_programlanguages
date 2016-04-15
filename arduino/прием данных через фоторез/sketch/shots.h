class LaserShot
{
  public:
    LaserShot(int LaserPin);
    ~LaserShot();  
    int PIN;
    
    int getCountShotsFromPortData(char portData);
    
    void addQueue(int countShotByLaser);
    int countShotsInArr = 3; // максим число хранения выстрелов
    int arrShots[3]; // максим число хранения выстрелов (одно и то же число)
    int currentIndexArr = 0;
    
    bool laserFireFromFire();
    int fireShots = 0;
     
    int countShotsFromCase;
  private:
    int countShots;
};

LaserShot::LaserShot(int LaserPin)
{
  PIN = LaserPin;
}
LaserShot::~LaserShot(){}

int LaserShot::getCountShotsFromPortData(char portData)
{
  {    
    countShotsFromCase = 0;
    switch (portData) //читаем переменную (по 1 символу) с порта
    { 
      case 'w':
      {
        int countShotsFromCase = 15;
        break;
      }
    }
  } 
  return countShotsFromCase;
}

void LaserShot::addQueue(int countShotByLaser)
{
  arrShots[currentIndexArr] = countShotByLaser;
  // добавить в очередь выстрелов
  // где 1-ый эл-т нельза трогать т.к. он отстреливается
}

bool LaserShot::laserFireFromFire()
{
  if (arrShots[0])
  {
    if (fireShots <= 0) // чтоб не перезаписывать каждый раз fireShots
      fireShots = arrShots[0];
     
     fireShots -= 1;
     
     if (fireShots <= 0) // если  
      {
        // arrShots[0] удали
        return false;
      }
     return true;
  }
}

/*
IN HEAD
const int laserpin = 11;
LaserShot laser(laserpin);

IN SETUP()
void setup()
{
  Serial.begin(9600);  
  pinMode(laser.PIN, OUTPUT);
}

IN LOOP
 if (Serial.available() > 0)
  {
    char portData = Serial.read();
    int countShotsByLaser = laser.getCountShotsFromPortData(portData); // по case сравню полученные данные с базой выстрелов
    laser.addQueue(countShotsByLaser); 
  }
  bool canLaserFire = laser.laserFireFromFire();
  digitalWrite(laser.PIN, canLaserFire);
*/
