class Pokemon
  attr_accessor :name, :type, :db, :id, :hp, :knows_default_hp
  def initialize(id=0, name, type, hp, db)
    @id = id
    @name = name
    @type = type
    @hp = knows_default_hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) 
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id=?", id)
  end

  def self.update_hp(id, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id=?", hp, id)
  end

  def self.knows_default_hp(id, db)
    db.execute("SELECT hp FROM pokemon WHERE id = ?", id)
  end

  def self.alter_hp(id, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
    @hp = hp
  end
end
