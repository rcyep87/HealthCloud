5.times do |n|
  user = User.new({
        first_name:    %w(Tom James Jeff Justin Travis).shuffle.sample,
        middle_name:   "D.",
        last_name:     "Smith",
        dob:           "1982-07-1#{n + 1}",
        ssn:           "###-##-####",
        email:         "test#{n + 1}@example.com",
        mobile_phone:  "+18324884746" })

    user.password = "password"
    user.save!

    MedCoverage.create({
          carrier:            "Blue Cross Blue Shield of Texas",
          plan_level:         "Platinum",
          network_type:       "PPO",
          memberid:           "BC#{n + 1}293879BC",
          pcp_fee:            50,
          specialist_fee:     75,
          er_fee:             500,
          rx_brand_fee:       75,
          rx_generic_fee:     35,
          in_net_deduct_ind:  3500,
          out_net_deduct_ind: 7500,
          co_ins_percent:     "90/10",
          out_of_pocket_max:  8500,
          renewal_date:       "2016-12-19",
          effective_date:     "2015-12-19",
          user_id:            user.id })


    5.times do
    Prescription.create({
          name:                %w(Tylenol Allegra Cipro Avapro Lipitor Zyrtec Flomax).shuffle.sample,
          dosage:              100,
          frequency:           "1x day",
          brand:               true,
          date_prescribed:     "2015-11-09",
          refill_till:         "2016-01-01",
          user_id:             user.id })
    end

    5.times do
    Visit.create({
          dos:                  "2015-11-01",
          physician_first:      "Bradley",
          physician_last:       "Rodgers",
          reason_for_visit:     %w(stomach sleep stress ankle).sample,
          diagnosis:            ["sleep", "change diet", "on feet too much", "take vacation"].shuffle.sample,
          user_id:              user.id })
    end

    5.times do |x|
      Sleep.create({
          hours:         rand(10),
          date_of_sleep: "2015-11-1#{x + 1}",
          user_id:       user.id })
    end

    5.times do |y|
      Step.create({
          steps_today:     rand(10000),
          date_of_steps:   "2015-11-1#{y +1}",
          user_id:         user.id })
    end
end
