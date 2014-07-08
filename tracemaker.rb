#
#
#

# Change the values Below

#print "# Track Width >>"
wtr = "1.07272"#gets

#print "# Track Spacing >>"
wi = "0.20"#gets

#print "# Layer num. >>"
layer = "16"#gets

#print "# Start position >>"
start = "6,64"#gets

#print "# Finish position >>"
finish = "94,36"#gets

#print "# Signal name >>"
signal = "N$97"#gets

#-----------------------------------

def genTraces(wtr, wi, start, finish, layer, signal)

  strt = start.split(',')
  fnsh = finish.split(',')

  print strt
  print "\n"
  print fnsh
  print "\n"

  wb = Float(strt[1])-Float(fnsh[1])

  print "%f\n" % wb

  ntr = wb/(Float(wtr)+Float(wi))+1

  print "------------------------------------\n"
  print "Number of tracks: #{ntr}\n"
  print "------------------------------------\n"

  print "------------------------------------\n"
  print "Eagle Script\n"
  print "------------------------------------\n"

  puts "GRID MM"
  puts "LAYER #{layer}"

  firsty = 0
  lasty = 0


  for i in 0..Integer(ntr)-1 do

    hc = Array.new
    vc = Array.new


    cy = Float(strt[1])-i*(Float(wtr)+Float(wi))
    ny = cy-(Float(wtr)+Float(wi))

    if i == 0
      firsty = cy
    elsif i == Integer(ntr)-1
      lasty = cy
    end


    if i%2 == 0
      #      x        y      x  y
      hc = [strt[0],fnsh[0],cy,cy]
      if i < Integer(ntr)-1
        #      x        y      x  y
        vc = [fnsh[0],fnsh[0],cy,ny]
      end
    else
      hc = [fnsh[0],strt[0],cy,cy]
      if i < Integer(ntr)-1
        vc = [strt[0],strt[0],cy,ny]
      end
    end

    # (x start, y start) (x end, y end)

    print "WIRE '%s' %f (%f %f) (%f %f)\n" % [signal,Float(wtr),Float(hc[0]),Float(hc[2]),Float(hc[1]),Float(hc[3])]
    if i < Integer(ntr)-1
      print "WIRE '%s' %f (%f %f) (%f %f)\n" % [signal,Float(wtr),Float(vc[0]),Float(vc[2]),Float(vc[1]),Float(vc[3])]
    end
  end

  print "------------------------------------\n"
  print "End of Script - Total displacement: #{firsty-lasty}\n"
  print "------------------------------------\n"



end

genTraces(wtr, wi, start, finish, layer, signal)
