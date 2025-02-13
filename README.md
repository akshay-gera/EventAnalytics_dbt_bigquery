# Data Models Documentation

This repository contains a collection of data models used for event tracking and analysis across mobile and web platforms. Below is the documentation for each model, its description, and details about the columns within each table.

## Problem Context

This project tries to unite two disparate data sources of event data about customer interactions (through mobile app and web): We are transforming this raw user interaction data from both mobile and web platforms to help our team answer some preliminary questions about the core engagement metrics:

- Daily Active Users (DAU): Any activity on the platform
- Daily Active Learners: People engaging with the content of the platform
- Content Completion: Customers who finished consuming the content
- Regional Activity: Activity across different countries

The data modeling exercise also builds the foundation of the transformation from raw disparate data to more structured data models. This would create an opportunity for a more detailed analysis of our customer events on the web and mobile app 

## Data Model Diagram

![image](https://github.com/user-attachments/assets/c6558f19-6f6f-471c-b0aa-5ccc9f709c24)


## Data Modeling Logic

To bring together the mobile and web event data, we apply the following transformations:

- **Data Normalization**: Breaking the raw data in Fact and dimension tables was necessary for efficient and optimized data modeling. This is done to ensure star schema where single fact table can be connected to dimensions to get more granularity
- **Union to Get Fct_Events**: The mobile and web data are first unionized, based on the common columns between both data. A data source identifier is given to keep track of source data after unionization. 
- **Mobile Data Attributes**: The columns specific to mobile data attributes coming from mobile event data as stored as a dimension table with user_id, and session_id as primary keys. We can join this with Fct_events to get more granularity of mobile event data
- **Web Data Attributes**: On similar lines, create a dimension table on web event data attributes also with user_id, and session_id as primary keys. We can join this with Fct_events to get more granularity of mobile event data

## Example of Data in `fct_events`

Here's an example of the data structure and typical values stored in the `fct_events` model:

| event_source | event_timestamp  | event_name | user_id | user_access_type | session_id | country_code | item_id |
|--------------|------------------|------------|---------|------------------|------------|--------------|---------|
| mobile       | 2025-02-12 09:15 | view_item  | 12345   | premium          | 67890      | US           | 98765   |
| web          | 2025-02-12 09:20 | click_item | 12346   | free             | 67891      | CA           | 98766   |

This table shows how each row represents a distinct user interaction with the platform, including the source of the event (mobile or web), timestamp, type of event, and details of the session.

