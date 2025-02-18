# Mint Classics Inventory Optimization Project  

## Overview  
Mint Classics, a retailer specializing in classic model cars and collectible vehicles, is considering closing one of its storage facilities. To support this data-driven decision, the company seeks insights into inventory optimization and warehouse consolidation.  

Using **MySQL Workbench**, I conducted an in-depth analysis of the company’s inventory and sales data to identify inefficiencies, assess inventory turnover, and determine the most suitable warehouse for closure.  

## Objectives  
- Explore products currently in inventory.  
- Identify key factors influencing inventory reorganization and reduction.  
- Provide analytical insights and data-driven recommendations.  

## Data & Methodology  
- The data was imported from a **MySQL database** using a provided script, which created and populated the Mint Classics relational database.  
- Analysis was conducted by writing **SQL queries** in MySQL Workbench to extract insights on:  
  - Warehouse performance  
  - Inventory turnover  
  - Product performance  

## Key Findings  

The analysis aimed to identify the most suitable warehouse for closure based on inventory efficiency and sales performance. The key steps and insights gained from our approach are as follows:  

### **1. Warehouse Capacity Analysis**  
- Evaluated total storage utilization for each warehouse.  
- **Warehouse C (West) had the lowest occupancy**, suggesting inefficient space usage.  

📌 *[Warehouse capacity analysis query: `queries/warehouse_capacity.sql` | Results: `results/warehouse_capacity_results.csv`]*  

### **2. Revenue Performance by Warehouse**  
- Assessed total sales revenue per warehouse.  
- **Warehouse C (West) generated the least revenue**, reinforcing its case for closure.  

📌 *[Revenue analysis query: `queries/revenue_analysis.sql` | Results: `results/revenue_analysis_results.csv`]*  

### **3. Product Line Investigation**  
- Examined the types of products stored in Warehouse C.  
- **Warehouse C only stocked vintage cars**, whereas other warehouses stored up to two product lines.  
📌 [Product Line query: queries/warehouse_c_products.sql | Results: results/warehouse_c_products.csv]

### **4. Inventory Turnover Analysis**  
- Calculated inventory turnover for each warehouse by comparing total stock levels to quantity ordered.  
- While **Warehouse C ranked third in turnover**, further analysis showed all warehouses had products with **high inventory but low sales**.  

📌 *[Inventory turnover query: `queries/inventory_turnover.sql` | Results: `results/inventory_turnover_results.csv`]*  

### **5. Low-Moving and Excess Inventory Products**  
- Identified:  
  - **A product with zero recorded sales**  
  - **Several high-inventory products with low sales**, consuming significant storage space.  
- Conversely, some high-demand products had **low inventory**, indicating potential supply chain inefficiencies.  
- The **marketing team will determine thresholds** for discontinuing products.  

📌 *[Low-moving products query: `queries/low_moving_products.sql` | Results: `results/low_moving_products_results.csv`]*  

## Conclusion  
Based on warehouse capacity, revenue performance, and inventory turnover, Warehouse C (West) emerges as the strongest candidate for closure. Additionally, relocating inventory from Warehouse C would be more cost-effective and efficient, as it occupies the least storage space compared to the other warehouses.

However, further discussions with the marketing team and supply chain managers are necessary to finalize the discontinuation of specific products and determine the optimal redistribution of inventory across the remaining warehouses.

📌 *[See full SQL queries in `/queries/` and results in `/results/`]*  
