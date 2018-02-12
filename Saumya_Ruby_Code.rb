class Aircraft
  def initialize(x,y,aircraft_model)
    @xCord = x
    @yCord = y
    @aircraft_model = aircraft_model
    @acc = "1"
  end

  def moving(x,y)
    i=0
    xArray=[]
    yArray=[]
    @flightpath= []
    m=(y-@yCord)/(x-@xCord)
    b=y-m*x
    while i <= (x-@xCord)
      xArray.push(@xCord+i)
      yArray.push(m*xArray[i]+b)
      i=i+1
      i=0
      while i<xArray.length
        @flightpath.push(xArray[i].to_f.round(1).to_s + "," + yArray[i].to_f.round(1).to_s)
        i=i+1
      end
    end
  end
end

class Boeing < Aircraft
  def initialize(boeingRange,boeingSpeed,boeingX,boeingY)
    @BoeingRange = boeingRange
    @BoeingSpeed = boeingSpeed
    @BoeingX = boeingX
    @BoeingY = boeingY
    @aircraft_model="Boeing-747"
    super(rand(1..4),rand(1..4),@aircraft_model)
    moving(boeingX,boeingY)
  end

  def getaircraft_model()
    return @aircraft_model
  end
  def getaircraftrange()
    return @BoeingRange
  end
  def getmaxspeed()
    return @BoeingSpeed
  end
  def getacc()
    return @acc
  end
  def flightpath()
    return @flightpath.join(",")
  end
end

class Privatejet < Aircraft
  def initialize(privateRange,privateSpeed,privateX,privateY)
    @acceleration= "1"
    @Private_Range= privateRange
    @Private_Speed= privateSpeed
    @PrivateX= privateX
    @PrivateY= privateY
    @aircraft_model="Private Jet"
    super(rand(1..4),rand(1..4),@aircraft_model)
    moving(@PrivateX,@PrivateY)
  end

  def getAircraft_Model()
    return @aircraft_model
  end
  def getAcc()
    return @acceleration
  end
  def getMaxSpeed()
    return @Private_Speed
  end
  def getAircraftRange()
    return @Private_Range
  end
  def flightpath()
    return @flightpath.join(",")
  end
end

10.times do |i|
  if i<7
    a = Boeing.new("6100","100",rand(5..10),rand(5..10))
    puts(
        "Aircraft-Model: " + a.getaircraft_model +
            "\nAircraft-Range: " + a.getaircraftrange+
            "\nAircraft-Max-Speed: " + a.getmaxspeed +
            "\nAircraft-Acceleration: " + a.getacc+
            "\nFLIGHT-PATH(x, y): " +a.flightpath + "\n\n"
    )
  else
    a = Privatejet.new("7100","710",rand(5..10),rand(5..10))
    puts(
        "Aircraft-Model: " + a.getAircraft_Model +
            "\nAircraft-Range: " + a.getAircraftRange+
            "\nAircraft-Max-Speed: " + a.getMaxSpeed +
            "\nAircraft-Acceleration: " + a.getAcc+
            "\nFLIGHT-PATH(x, y): " + a.flightpath + "\n\n"
    )
  end
end