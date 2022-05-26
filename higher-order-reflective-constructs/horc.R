################################################################################
# Illustrating the validity higher-order reflective constructs (HORC)
# by Glauber Santos
# https://orcid.org/0000-0001-8731-101X


# Based on the paper
# "On the validity and meaningfulness of higher-order reflective constructs: A reply to Mikulić"
# by Glauber Santos
# Tourism Management (2022)
# https://doi.org/10.1016/j.tourman.2022.104563

# Data from the paper
# "Confirmatory Factor Analysis of the WHO Violence Against Women Instrument in Pregnant Women: Results from the BRISA Prenatal Cohort"
# PlosONE (2014)
# https://doi.org/10.1371/journal.pone.0115382


# Load libraries (install previously, if necessary)
library(xlsx)
library(psych)
library(lavaan)
library(lavaanPlot)


# Download dataset
dataURL <- "http://journals.plos.org/plosone/article/file?type=supplementary&id=10.1371/journal.pone.0115382.s001"
temp <- tempfile(fileext = ".xlsx")
download.file(dataURL, destfile=temp, mode='wb')

# Load dataset
dt <- read.xlsx(temp, sheetIndex = 1)

# Check dataset
head(dt)


# Calculate McDonald's Omega
omega(dt)


# Structural equation modeling
model <- "violence = ~ psychol + physical + sexual
          psychol = ~ v1 + v2 + v3 + v4
          physical = ~ v5 + v6 + v7 + v8 + v9 + v10
          sexual = ~ v11 + v12 + v13"

fit <- sem(model, dt)
summary(fit, standardized = TRUE)
lavaanPlot(model=fit, coefs=T)