# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create({ username: "admin", email: "admin@cuis.coop", password: "adminadmin", password_confirmation: "adminadmin", first_name: "Admin", last_name: "Admin", roles: %i(super_admin) })

cu = CreditUnion.create({ full_name: "Koperasi Kredit Melania", short_name: "Melania CU"})

branch = Branch.create({ full_name: "Kantor Cabang Sukaluyu", short_name: "Sukaluyu", credit_union: cu })

member = Member.create({ first_name: "Sirius", last_name: "Dely", birth_place: "Bukittingi", birth_date: "1984-02-19", credit_union: cu, branch: branch })

saving_product = SavingProduct.create({ full_name: "Tabungan Melania", short_name: "Tabmel", interest_rate: 9.0, credit_union: cu })

saving_account = SavingAccount.create({ number: "123", interest_rate: 9.0, saving_product: saving_product, member: member })
