require 'sinatra'

class Equation
  def initialize(a, b)
    @a_value = a.to_f
    @b_value = b.to_f
  end
end

class Linear < Equation
  def initialize(a, b)
    super(a, b)
  end

  def calculate
    x = (-1) * @b_value / @a_value
  end
end

class Quadratic < Equation
  def initialize(a, b, c)
    super(a, b)
    @c_value = c.to_f
  end

  def calculate
    discriminant = @b_value ** 2 - 4 * @a_value * @c_value
    if discriminant < 0
      return "Error( discriminant <0)"
    elsif @a_value == 0
      return Linear.new(@b_value, @c_value).calculate
    end
    x1 = (-@b_value - Math.sqrt(discriminant)) / (2 * @a_value)
    x2 = (-@b_value + Math.sqrt(discriminant)) / (2 * @a_value)
    return x1, x2
  end
end

class App < Sinatra::Base

  get '/' do
    erb :index
  end
  post '/' do
    @a_value = params[:a_value]
    @b_value = params[:b_value]
    @c_value = params[:c_value]
    @reg_radio = params[:regRadio]
    if @reg_radio == "quadratic"
      @object = Quadratic.new(@a_value, @b_value, @c_value)
    else
      @object = Linear.new(@a_value, @b_value)
    end
    @result = @object.calculate()
    erb :index
  end

  not_found do
    status 404
    "Something wrong!"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

