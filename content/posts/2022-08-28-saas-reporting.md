---
title: "SaaS Reporting"
date: 2022-08-28T09:30:30Z
draft: false
tags: ["reporting", "rails"]
featured_image: "images/2022/ice_lick.jpg"
---
Reporting requirements for a SaaS product often become more important as customer size increases. Enterprise Ready have a [great article](https://www.enterpriseready.io/features/advanced-reporting/) explaining this.

Below I have attempted to summarise my experience building a single instance, multi-tenant SaaS solution.
- [challenges we see](#challenges)
- [things we have done so far](#things-we-have-done)
- [approaches we may consider in future](#approaches-we-may-consider-in-future)

# Challenges
## User experience
Users are familiar with creating reports with tools such as Excel and Tableau. They expect a similar quality of experience from a SaaS reporting tool. Reporting is not our core competence and we will not be able to invest as much into a reporting tool as companies such as Microsoft or Salesforce.

## Logically separated data
One of the key challenges with using existing reporting tools is that we are a single instance multi tenant SaaS solution. This means that customers data is logically separated by security rules we define in the application.  Any reporting solution must adhere to the rules to prevent one customer accessing another customers data.


# Things we have done so far
## Basic charts
We have provided these types of reports since the beginning. They allow a user to visualise details of a single event.

## Excel exports
We have also had these for some time. Initially we generated CSV files which can be opened in Excel, but later moved to generating XLSX files which allow control over formatting, and have more reliable support for special characters (e.g. accents).

## Dashboards
More recently we have added dashboards that provide canned reports which allow users to report across many events. For example to compare the success of different categories or users. In some cases these have some limited customisation features (for example restrict the report to a date range or subset of users).

## API Exports
API exports allow large volumes of data to be exported to a reporting tool. We have a number of reporting API endpoints that are designed for this purpose We have had success using this in conjunction with Power BI to produce bespoke reports for larger customers. Power BI is often already being used by the organisation, and their are benefits to combining data from different sources. Power BI seems to be most popular, but other products (e.g. Tableau) also have the ability to process data in json format.


# Approaches we may consider in future
## Embedded reports - provide many canned reports
We could produce a large number of canned reports which users can choose from in order to find the ones that meets their need. This would be relatively easy although each additional report would require further developer time. For users, it could be frustrating to work through a large number of reports in order to (hopefully) find one that meets their needs.

**Estimated Difficulty: 2/5**

## Embedded report builder - open source
We have researched open source components that could be embedded into our solution. Unfortunately, we have not identified a suitable option which works with our platform (Ruby on Rails) and offers the ability for end users to build their own reports

**Estimated Difficulty: 3/5**

## Embedded report builder - commercial
We have researched commercial offerings that could be embedded into our solution.
We have even trialled one such solution. At the time. the available solutions used  different stacks to our own, which added to the implementation effort. This was due to two main things. Firstly, we needed to understand and maintain a new set of technologies. Secondly, we needed to ensure that our security rules were correctly translated to the new platform.

**Estimated Difficulty: 4/5**

## Embedded report builder - build
We have considered building an embedded report builder, however this is a significant project and not our core competence, and therefore we have not pursued this approach. The estimated difficulty would be dependent on the features in the end product. Reproducing the user experience in tools such as Power BI would clearly be out of reach.

**Estimated Difficulty: 5/5**

## Separate reporting database for each customer
A separate reporting database for each customer would allow us to provide customers with a way to access just their data. This approach would potentially allow us to re-use our existing security rules to separate the data. This would probably mean that data is refreshed as a background job, so reports would not be completely up to date. At its simplest, we would just provide the database to the customer and allow them to use existing reporting tools to analyse it. We could also host the database for them.

**Estimated Difficulty: 2/5**

## Separate reporting environment for each customer
Building on the separate reporting database, we could also host to database and provide a reporting tool to analyse the data. Various open source or commercial solutions are available for this purpose, however maintaining these will add additional complexity to our infrastructure.

# Conclusion
Reporting is an important feature of most SaaS solutions. There are many ways to implement this depending on customer requirements. It may be necessary to use a number of different approaches to address all of the use cases.