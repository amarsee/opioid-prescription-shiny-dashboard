library(shinydashboard)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(usmap)

# load datset of prescription counts by state
prescriptions_per_hundred_thousand <- readRDS('data/prescription_per_hundred_thou.RDS')


names(prescriptions_per_hundred_thousand) <- c("State", "Population", "Deaths", "Deaths.Per.Hundred.Thousand", 
                                               "Acetaminophen Codeine", "Fentanyl", 
                                               "Hydrocodone Acetaminophen", "Hydromorphone HCL", "Methadone HCL", "Morphine Sulfate", 
                                               "Morphine Sulfate ER", "Oxycodone Acetaminophen", "Oxycodone HCL", "Oxycontin", "Tramadol HCL")

opioids <- c("Acetaminophen Codeine", "Fentanyl", 
             "Hydrocodone Acetaminophen", "Hydromorphone HCL", "Methadone HCL", "Morphine Sulfate", 
             "Morphine Sulfate ER", "Oxycodone Acetaminophen", "Oxycodone HCL", "Oxycontin", "Tramadol HCL")


