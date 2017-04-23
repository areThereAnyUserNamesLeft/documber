Feature: Fill in the missed bin from
Scenario:
  Given We navigate to the Missed bin form
  When We click the DPA confirmation
  Then We see the next button appear
  When We click the next button
  Then We see the bin options appear
  When We click the household waste option
  Then We see the postcode search appear
  When We enter a valid postcode
  Then We see the select box appear
