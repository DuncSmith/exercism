class ETL
  def self.transform(x)
    x.reduce({}) {|a, sls| a.merge sls[1].reduce({}) {|al, l| al.merge({l.downcase => sls[0]})}}
  end
end
