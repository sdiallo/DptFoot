
departments = {
  'Seine et Marne' => { :code => 77, :places => [{ :name => 'Melun', :address => '9 rue Baquet', :town => 'Melun'}] },

  'Yvelines' => { :code => 78, :places => [{ :name => 'Baquet', :address => '9 rue Baquet', :town => 'Elancourt'},
                { :name => 'Neauphle', :address => '9 rue Neauphle', :town => 'Neauphle le Vieux'}] },

  'Paris' => { :code => 75, :places => [{ :name => 'Balard', :address => '4219 rue Balard', :town => '8eme Arrondissement'},
             { :name => "Porte d'Italie", :address => '541 avenue Italie', :town => '13eme Arrondissement'}] },

  'Seine Saint Denis' => { :code => 93, :places => [{ :name => 'Saint denis', :address => '4219 rue Badelard', :town => 'Bobigny'},
                         { :name => "Plaine saint denis", :address => '541 avenue Italie', :town => 'Plaine saint denis'}] },

  'Val de Marne' => { :code => 94, :places => [{ :name => 'Villejuif', :address => '4219 rue Badelard', :town => 'Villejuif'},
                    { :name => "Ivry", :address => '541 avenue Ivry', :town => 'Ivry'}] },

  "Val d'Oise" => { :code => 95, :places => [{ :name => 'Cergy', :address => '4219 rue Badelard', :town => 'Cergy'}] }
}

departments.each do |key, value|
  dep = Department.create!(name: key, code: value[:code])
  value[:places].each do |place|
    dep.places.create!(name: place[:name], address: place[:address], town: place[:town])
  end
end