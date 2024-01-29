
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Data Analysis and Visualisation Exercises Using R

<!-- badges: start -->
<!-- badges: end -->

The following exercises are aimed at aiding the learner use R for
performing some types of data analysis and visualisation techniques that
are illustrative of various approaches useful in most data projects.

For each exercise, the learner is expected to create either an R script
or an R Markdown document to perform the tasks requested.

## Exercise 1: Statistical methods for assessing agreement between two methods of clinical measurement

This exercise is based on:

Bland, J. M. & Altman, DouglasG. Statistical Methods For Assessing
Agreement Between Two Methods Of Clinical Measurement. Lancet 327,
307–310 (1986).

The dataset used in the paper can be accessed from the
`teaching_datasets` repository. The URL to the `.dat` file is
<https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/ba.dat>.

The `ba` dataset contains peak expiratory flow rate (PEFR) measurements
(in litres per minute) taken with a **Wright peak flow metre** (Wright)
and a **Mini-Wright peak flow metre** (Mini-Wright). This is the same
data that is presented in the referenced Lancet article above.

For this exercise, use the R script and/or R Markdown titled
`exercise1`.

### Tasks:

1.  Read the `ba.dat` dataset from the GitHub URL provided above.

2.  Create a function that will calculate the following metrics required
    by the **Bland and Altman plot** as described in the article
    referenced above:

    1.  Mean of the per subject measurements made by the **Wright** and
        the **Mini-Wright**;

    2.  Difference between the per subject measurements made by the
        **Wright** and the **Mini-Wright**;

    3.  Mean of the difference between the per subject measurements made
        by the **Wright** and the **Mini-Wright**; and,

    4.  Lower and upper limits of agreement between the per subject
        measurements made by the **Wright** and the **Mini-Wright**.

3.  Create a function that creates a **Bland and Altman plot** as
    described in the article.

4.  Create a short report that shows

    1.  A table of the mean and difference of per subject measurements
        made by the **Wright** and the **Mini-Wright**;

    2.  A **Bland and Altman plot**; and,

    3.  A short discussion of the findings with regard to the agreement
        between the **Wright** and **Mini-Wright** tools.

## Exercise 2: Performing tests for correlations and associations between variables

This exercise uses the `fem.dat` dataset accessible from the
`teaching_datasets` repository. The URL to the `.dat` file is
<https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/fem.dat>.
The `fem.dat` dataset is from 118 female pyschiatric patients.

The variables in the dataset are:

| **Variable Name** | **Variable Description**                                |
|:------------------|:--------------------------------------------------------|
| ID                | Patient ID                                              |
| AGE               | Age in years                                            |
| IQ                | IQ score                                                |
| ANX               | Anxiety (1 = none, 2 = mild, 3 = moderate, 4 = severe)  |
| DEP               | Depression (1 = none, 2 = mild, 3 = moderate or severe) |
| SLP               | Sleeping normally (1 = yes, 2 = no)                     |
| SEX               | Lost interest in sex (1 = yes, 2 = no)                  |
| LIFE              | Considered suicide (1 = yes, 2 = no)                    |
| WT                | Weight change (kg) in previous 6 months                 |

For this exercise, use the R script and/or R Markdown titled
`exercise2`.

### Tasks

1.  Read the `fem.dat` dataset from the GitHub URL provided above;

2.  Get a summary of the variables for `AGE`, `IQ`, and `WT` using
    tabular and graphical methods;

3.  Test the correlation between weight gain (`WT`), age in years
    (`AGE`), and IQ (`IQ`) graphically and through formal statistical
    tests;

4.  Calculate the odds ratio of someone with any form of anxiety
    considering suicide and calculate the odds ratio of someone with any
    for of depression considering suicide;

5.  Specify a logistic regression model that looks into the
    correlation/association of considering suicide (`LIFE`) with
    depression (`DEP`), anxiety (`ANX`), abnormal sleep (`SLP`), and
    loss of interest in sex (`SEX`); and,

6.  Create a short report that shows

    1.  A tabular and graphical summary of the `AGE`, `IQ`, and `WT`
        variables;

    2.  Results of correlation test between weight gain (`WT`), age in
        years (`AGE`), and IQ (`IQ`);

    3.  Odds ratio of considering suicide and anxiety and odds ratio of
        considering suicde and depression;

    4.  Results of logstic regression model for considering suicide with
        depression (`DEP`), anxiety (`ANX`), abnormal sleep (`SLP`), and
        loss of interest in sex (`SEX`); and,

    5.  A short discussion of the findings.

## Exercise 3: Time series plotting and analysis

This exercise uses the `malaria.dat` dataset accessible from the
`teaching_datasets` repository. The URL to the `.dat` file is
<https://raw.githubusercontent.com/OxfordIHTM/teaching_datasets/main/malaria.dat>.
The `malaria.dat` dataset contains data on rainfall (in mm) and the
number of cases of malaria reported from health centres in an
administrative district of Ethiopia between July 1997 and July 1999

For this exercise, use the R script and/or R Markdown titled
`exercise4`.

### Tasks

1.  Show the trend of malaria cases over time in this administrative
    district of Ethiopia;

2.  Show the trend of amount of rainfall over time in this
    administrative district of Ethiopia;

3.  Specify a linear model between malaria cases and amount of rainfall;
    and,

4.  Create a short report that shows

    1.  A plot of the trend of malaria cases over time;

    2.  A plot of the trend of amount of rainfall over time overlaid
        onto the malaria cases plot;

    3.  Results of the linear model of malaria cases and rainfall; and,

    4.  A short discussion of the findings.

## Exercise 4: Performing text mining and topic modelling

This exercise uses the text data on COVID-related resolutions issued
from 28 January 2020 to 30 July 2020 by the Inter-Agency Task Force for
the Management of Emerging Infectious Diseases (IATF) in the
Philippines.

The data is accessible through the [`covidphtext`
package](https://github.com/como-ph/covidphtext) available from GitHub.

To install this package, you will first need to install the `remotes`
package:

``` r
install.packages("remotes")
```

and then install the `covidphtext` package from GitHub as follows:

``` r
remotes::install_github("como-ph/covidphtext")
```

Once installed, the full IATF resolutions dataset can be obtained by

``` r
library(covidphtext)
iatf_data <- combine_iatf()
```

For this exercise, use the R script and/or R Markdown titled
`exercise4`.

### Tasks

1.  What is the general trend of sentiments expressed in the various
    resolutions over time?

2.  What are the most common words (by sentiment) used in the various
    resolutions?

3.  What general themes can be elicited from the various resolutions in
    the dataset? How do these themes relate to the general approach
    taken by the Philippine government nationally to manage the COVID-19
    pandemic?

4.  Create a short report that shows

    1.  various relevant plots of sentiment trend over time;

    2.  various relevant plots and tables showing term frequency;

    3.  various relevant plots and tables showing topics modelled from
        the resolutions; and,

    4.  A short discussion of the findings.
