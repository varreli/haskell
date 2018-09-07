data Price = Price Integer 
             deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata
                    deriving (Eq, Show)

data Airline = Papu | JetBlue | United
               deriving (Eq, Show)

data Vehicle = Car Manufacturer Price
               | Plane Airline
               deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
myPlane = Plane Papu

isCar :: Vehicle -> Bool

isCar (Car _ _) = True
isCar _         = False  
