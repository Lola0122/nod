require "RGem/version"

module RGem
  class Error < StandardError; end


  def self.solve(a, b)
    return nil unless valid_params? a, b
    c_a=a
    c_b=b
    res = []
    nod = 0
    if a.abs < b.abs
      a,b=b,a
    end
    while (b != 0)
      res.push(a/b)
      if a%b==0
        nod=b
      end
      a,b = b,a%b

    end
    u=[1,0]
    v=[0,1]
    for i in(1..res.length-1)
      u.push(u[-2]-res[i-1]*u[-1])
      v.push(v[-2]-res[i-1]*v[-1])
    end
    sprintf("%d=(%d)*(%d)+(%d)*(%d)", nod,c_a,u[-1],c_b,v[-1])

  end
  def self.valid_params?(a, b)
    a!=0 && b!=0 && [a, b].all? { |x| x.is_a? Numeric }
  end
  private_class_method :valid_params?

end
