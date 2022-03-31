require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.key?(title)
  end

  def >(other)
    @funding > other.funding
  end

  def hire(name, title)
    raise 'Invalid title' unless valid_title?(title)

    @employees << Employee.new(name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    raise 'not enough funding' unless @funding >= salary

    employee.pay(salary)
    @funding -= salary
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    @employees.reduce(0) { |sum, employee| sum + @salaries[employee.title] } / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other)
    @funding += other.funding
    @salaries = other.salaries.merge(@salaries)
    @employees += other.employees
    other.close
  end
end
