require 'pg'

class DB_manager
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