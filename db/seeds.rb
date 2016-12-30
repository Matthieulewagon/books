user1 = User.create!(email: ".lombard@hotmail.be",
                    password: "foobar",)
Book.create!(picture: "",
             price: "35$",
             title: "Physics quantique deuxième",
             description: "bon état",
             campus: "Saint Louis",
             year: "2 année bac",
             user_id: user1.id,
  )
Book.create!(picture: "",
             price: "35$",
             title: "Physics quantique deuxième",
             description: "bon état",
             campus: "Louvain la Neuve",
             year: "2 année bac",
             user_id: user1.id,
  )

Book.create!(picture: "",
             price: "25$",
             title: "Chimie première",
             description: "bon état",
             campus: "Louvain la Neuve",
             year: "1 année bac",
             user_id: user1.id,
  )
Book.create!(picture: "",
             price: "30$",
             title: "droit privé deuxième",
             description: "bon état",
             campus: "Louvain la Neuve",
             year: "2 année bac",
             user_id: user1.id,
  )

Book.create!(picture: "",
             price: "30$",
             title: "droit contitutionnelle deuxième",
             description: "bon état",
             campus: "Louvain la Neuve",
             year: "2 année bac",
             user_id: user1.id,
  )

Book.create!(picture: "",
             price: "40$",
             title: "droit contitutionnelle deuxième",
             description: "bon état",
             campus: "Louvain la Neuve",
             year: "1 année bac",
             user_id: user1.id,
  )
