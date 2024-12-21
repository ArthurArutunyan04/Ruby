require 'pg'

class DB_manager
  @instance = nil

  def self.instance(db_params)
    @instance ||= new(db_params)
  end

  private_class_method :new

  def initialize(db_params)
    @conn = PG.connect(db_params)
  end

  def exec_query(query)
    @conn.exec(query)
  end

  def close
    @conn.close
  end
end