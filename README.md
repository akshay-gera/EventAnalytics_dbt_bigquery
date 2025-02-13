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

- **Data Normalization**: Breaking the raw data in Fact and dimension tables was necessary for efficient and optimized data modeling. This is done to ensure star schema where a single fact table can be connected to dimensions to get more granularity
- **Union to Get Fct_Events**: The mobile and web data are first unionized, based on the common columns between both data. A data source identifier is given to keep track of source data after unionization. 
- **Mobile Data Attributes**: The columns specific to mobile data attributes coming from mobile event data are stored as a dimension table with user_id, and session_id as primary keys. We can join this with Fct_events to get more granularity of mobile event data
- **Web Data Attributes**: On similar lines, create a dimension table on web event data attributes also with user_id, and session_id as primary keys. We can join this with Fct_events to get more granularity of mobile event data

## Models Overview

### 1. `fct_events`
## Example of Data in `fct_events`
 **Description**: This model combines both sources - mobile and web event data, unionized based on the common columns, to provide a unified events analytics model.


| event_source | event_timestamp  | event_name | user_id | user_access_type | session_id | country_code | item_id |
|--------------|------------------|------------|---------|------------------|------------|--------------|---------|
| mobile       | 2025-02-12 09:15 | view_item  | 12345   | premium          | 67890      | US           | 98765   |
| web          | 2025-02-12 09:20 | click_item | 12346   | free             | 67891      | CA           | 98766   |

This table shows how each row represents a distinct user interaction with the platform, including the source of the event (mobile or web), timestamp, type of event, and details of the session.

### 2. `dim_app_device_features`
- **Description**: This model provides additional device information for each session ID and user ID from mobile event data. It includes details about the device used to log in to the app.



| session_id | user_id | client_id | device_locale_code | device_locale_country | device_locale_language | device_platform_name | event_version | device_make | application_version_code | application_version_name |
|------------|---------|-----------|--------------------|-----------------------|------------------------|----------------------|---------------|-------------|--------------------------|--------------------------|
| 67890      | 12345   | 54321     | en-US              | US                    | English                | Android              | 1.0           | Samsung     | 15                       | 1.2.3                    |
| 67891      | 12346   | 54322     | fr-CA              | CA                    | French                 | iOS                  | 1.2           | Apple       | 17                       | 1.3.0                    |


### 3. `dim_web_browser_attributes`
- **Description**: This model provides additional information about the browser and device used for web sessions, including details for each session ID and user ID.



| session_id | user_id | fingerprint | browser_name | browser_version | language | screen_resolution | device_type | cookies_enabled | referrer |
|------------|---------|-------------|--------------|-----------------|----------|-------------------|-------------|-----------------|----------|
| 67890      | 12345   | abc123      | Chrome       | 92.0            | en-US    | 1920x1080         | Desktop     | 1               | google.com |
| 67891      | 12346   | def456      | Firefox      | 85.0            | fr-CA    | 1366x768          | Mobile      | 0               | facebook.com |
 

### 4. `dim_items`
- **Description**: This model contains information about the items interacted with during sessions. This is derived by unionizing web and mobile data



| item_id | item_title            | item_type |
|---------|-----------------------|-----------|
| 98765   | "The Great Gatsby"     | Book      |
| 98766   | "Introduction to SQL"  | Book      |
| 98767   | "How to Cook Pasta"    | Article   |
| 98768   | "Web Development 101"  | Article   |


### 5. `dim_events_arrival_times`
- **Description**: This model contains timestamps of event happening and when it reached our backend system.


| session_id | user_id | event_timestamp      | arrival_timestamp   |
|------------|---------|----------------------|---------------------|
| 67890      | 12345   | 2025-02-12 09:15:00  | 2025-02-12 09:16:30 |
| 67891      | 12346   | 2025-02-12 09:20:00  | 2025-02-12 09:21:05 |
| 67892      | 12347   | 2025-02-12 09:30:00  | 2025-02-12 09:31:15 |
| 67893      | 12348   | 2025-02-12 09:45:00  | 2025-02-12 09:46:45 |


## Glimpse of Front-End Dashboard Coming from Fct_Events Data Model

![image](https://github.com/user-attachments/assets/37e79b14-1420-4e0d-8ff9-84bf5489340d)
