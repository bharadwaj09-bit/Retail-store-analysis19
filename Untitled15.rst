.. code:: ipython3

    !pip install kaggle 
    import kaggle 
    !kaggle datasets download ankitbansal06/retail-orders -f orders.csv


.. parsed-literal::

    Requirement already satisfied: kaggle in c:\users\tadep\anaconda3\lib\site-packages (1.6.17)
    Requirement already satisfied: six>=1.10 in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (1.16.0)
    Requirement already satisfied: certifi>=2023.7.22 in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (2024.7.4)
    Requirement already satisfied: python-dateutil in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (2.9.0.post0)
    Requirement already satisfied: requests in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (2.32.2)
    Requirement already satisfied: tqdm in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (4.66.4)
    Requirement already satisfied: python-slugify in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (5.0.2)
    Requirement already satisfied: urllib3 in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (2.2.2)
    Requirement already satisfied: bleach in c:\users\tadep\anaconda3\lib\site-packages (from kaggle) (4.1.0)
    Requirement already satisfied: packaging in c:\users\tadep\anaconda3\lib\site-packages (from bleach->kaggle) (23.2)
    Requirement already satisfied: webencodings in c:\users\tadep\anaconda3\lib\site-packages (from bleach->kaggle) (0.5.1)
    Requirement already satisfied: text-unidecode>=1.3 in c:\users\tadep\anaconda3\lib\site-packages (from python-slugify->kaggle) (1.3)
    Requirement already satisfied: charset-normalizer<4,>=2 in c:\users\tadep\anaconda3\lib\site-packages (from requests->kaggle) (2.0.4)
    Requirement already satisfied: idna<4,>=2.5 in c:\users\tadep\anaconda3\lib\site-packages (from requests->kaggle) (3.7)
    Requirement already satisfied: colorama in c:\users\tadep\anaconda3\lib\site-packages (from tqdm->kaggle) (0.4.6)
    Dataset URL: https://www.kaggle.com/datasets/ankitbansal06/retail-orders
    License(s): CC0-1.0
    orders.csv.zip: Skipping, found more recently modified local copy (use --force to force download)
    

.. code:: ipython3

    import zipfile
    
    # Open the zip file
    with zipfile.ZipFile('orders.csv.zip', 'r') as zip_ref:
        # Extract all the contents
        zip_ref.extractall()
    
    # Zip file will automatically close when exiting the 'with' block
    

.. code:: ipython3

    import pandas as pd

.. code:: ipython3

    df = pd.read_csv('orders.csv',na_values=['Not Available','unknown'])

.. code:: ipython3

    df.head()




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }
    
        .dataframe tbody tr th {
            vertical-align: top;
        }
    
        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>Order Id</th>
          <th>Order Date</th>
          <th>Ship Mode</th>
          <th>Segment</th>
          <th>Country</th>
          <th>City</th>
          <th>State</th>
          <th>Postal Code</th>
          <th>Region</th>
          <th>Category</th>
          <th>Sub Category</th>
          <th>Product Id</th>
          <th>cost price</th>
          <th>List Price</th>
          <th>Quantity</th>
          <th>Discount Percent</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>0</th>
          <td>1</td>
          <td>2023-03-01</td>
          <td>Second Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Henderson</td>
          <td>Kentucky</td>
          <td>42420</td>
          <td>South</td>
          <td>Furniture</td>
          <td>Bookcases</td>
          <td>FUR-BO-10001798</td>
          <td>240</td>
          <td>260</td>
          <td>2</td>
          <td>2</td>
        </tr>
        <tr>
          <th>1</th>
          <td>2</td>
          <td>2023-08-15</td>
          <td>Second Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Henderson</td>
          <td>Kentucky</td>
          <td>42420</td>
          <td>South</td>
          <td>Furniture</td>
          <td>Chairs</td>
          <td>FUR-CH-10000454</td>
          <td>600</td>
          <td>730</td>
          <td>3</td>
          <td>3</td>
        </tr>
        <tr>
          <th>2</th>
          <td>3</td>
          <td>2023-01-10</td>
          <td>Second Class</td>
          <td>Corporate</td>
          <td>United States</td>
          <td>Los Angeles</td>
          <td>California</td>
          <td>90036</td>
          <td>West</td>
          <td>Office Supplies</td>
          <td>Labels</td>
          <td>OFF-LA-10000240</td>
          <td>10</td>
          <td>10</td>
          <td>2</td>
          <td>5</td>
        </tr>
        <tr>
          <th>3</th>
          <td>4</td>
          <td>2022-06-18</td>
          <td>Standard Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Fort Lauderdale</td>
          <td>Florida</td>
          <td>33311</td>
          <td>South</td>
          <td>Furniture</td>
          <td>Tables</td>
          <td>FUR-TA-10000577</td>
          <td>780</td>
          <td>960</td>
          <td>5</td>
          <td>2</td>
        </tr>
        <tr>
          <th>4</th>
          <td>5</td>
          <td>2022-07-13</td>
          <td>Standard Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Fort Lauderdale</td>
          <td>Florida</td>
          <td>33311</td>
          <td>South</td>
          <td>Office Supplies</td>
          <td>Storage</td>
          <td>OFF-ST-10000760</td>
          <td>20</td>
          <td>20</td>
          <td>2</td>
          <td>5</td>
        </tr>
      </tbody>
    </table>
    </div>



.. code:: ipython3

    df['Ship Mode'].unique()




.. parsed-literal::

    array(['Second Class', 'Standard Class', nan, 'First Class', 'Same Day'],
          dtype=object)



.. code:: ipython3

    #rename column names , make them lower case and replace them with spaces 

.. code:: ipython3

    df.columns=df.columns.str.lower()
    df.columns=df.columns.str.replace(' ','_')

.. code:: ipython3

    df.columns




.. parsed-literal::

    Index(['order_id', 'order_date', 'ship_mode', 'segment', 'country', 'city',
           'state', 'postal_code', 'region', 'category', 'sub_category',
           'product_id', 'cost_price', 'list_price', 'quantity',
           'discount_percent'],
          dtype='object')



.. code:: ipython3

    #derive new columns discount,sale price and profit 

.. code:: ipython3

    df['discount']=df['list_price']*df['discount_percent']*.01

.. code:: ipython3

    df['sale_price']=df['list_price']-df['discount']

.. code:: ipython3

    df['profit']=df['sale_price']-df['cost_price']

.. code:: ipython3

    df




.. raw:: html

    <div>
    <style scoped>
        .dataframe tbody tr th:only-of-type {
            vertical-align: middle;
        }
    
        .dataframe tbody tr th {
            vertical-align: top;
        }
    
        .dataframe thead th {
            text-align: right;
        }
    </style>
    <table border="1" class="dataframe">
      <thead>
        <tr style="text-align: right;">
          <th></th>
          <th>order_id</th>
          <th>order_date</th>
          <th>ship_mode</th>
          <th>segment</th>
          <th>country</th>
          <th>city</th>
          <th>state</th>
          <th>postal_code</th>
          <th>region</th>
          <th>category</th>
          <th>sub_category</th>
          <th>product_id</th>
          <th>cost_price</th>
          <th>list_price</th>
          <th>quantity</th>
          <th>discount_percent</th>
          <th>discount</th>
          <th>sale_price</th>
          <th>profit</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>0</th>
          <td>1</td>
          <td>2023-03-01</td>
          <td>Second Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Henderson</td>
          <td>Kentucky</td>
          <td>42420</td>
          <td>South</td>
          <td>Furniture</td>
          <td>Bookcases</td>
          <td>FUR-BO-10001798</td>
          <td>240</td>
          <td>260</td>
          <td>2</td>
          <td>2</td>
          <td>5.2</td>
          <td>254.8</td>
          <td>14.8</td>
        </tr>
        <tr>
          <th>1</th>
          <td>2</td>
          <td>2023-08-15</td>
          <td>Second Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Henderson</td>
          <td>Kentucky</td>
          <td>42420</td>
          <td>South</td>
          <td>Furniture</td>
          <td>Chairs</td>
          <td>FUR-CH-10000454</td>
          <td>600</td>
          <td>730</td>
          <td>3</td>
          <td>3</td>
          <td>21.9</td>
          <td>708.1</td>
          <td>108.1</td>
        </tr>
        <tr>
          <th>2</th>
          <td>3</td>
          <td>2023-01-10</td>
          <td>Second Class</td>
          <td>Corporate</td>
          <td>United States</td>
          <td>Los Angeles</td>
          <td>California</td>
          <td>90036</td>
          <td>West</td>
          <td>Office Supplies</td>
          <td>Labels</td>
          <td>OFF-LA-10000240</td>
          <td>10</td>
          <td>10</td>
          <td>2</td>
          <td>5</td>
          <td>0.5</td>
          <td>9.5</td>
          <td>-0.5</td>
        </tr>
        <tr>
          <th>3</th>
          <td>4</td>
          <td>2022-06-18</td>
          <td>Standard Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Fort Lauderdale</td>
          <td>Florida</td>
          <td>33311</td>
          <td>South</td>
          <td>Furniture</td>
          <td>Tables</td>
          <td>FUR-TA-10000577</td>
          <td>780</td>
          <td>960</td>
          <td>5</td>
          <td>2</td>
          <td>19.2</td>
          <td>940.8</td>
          <td>160.8</td>
        </tr>
        <tr>
          <th>4</th>
          <td>5</td>
          <td>2022-07-13</td>
          <td>Standard Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Fort Lauderdale</td>
          <td>Florida</td>
          <td>33311</td>
          <td>South</td>
          <td>Office Supplies</td>
          <td>Storage</td>
          <td>OFF-ST-10000760</td>
          <td>20</td>
          <td>20</td>
          <td>2</td>
          <td>5</td>
          <td>1.0</td>
          <td>19.0</td>
          <td>-1.0</td>
        </tr>
        <tr>
          <th>...</th>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
          <td>...</td>
        </tr>
        <tr>
          <th>9989</th>
          <td>9990</td>
          <td>2023-02-18</td>
          <td>Second Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Miami</td>
          <td>Florida</td>
          <td>33180</td>
          <td>South</td>
          <td>Furniture</td>
          <td>Furnishings</td>
          <td>FUR-FU-10001889</td>
          <td>30</td>
          <td>30</td>
          <td>3</td>
          <td>4</td>
          <td>1.2</td>
          <td>28.8</td>
          <td>-1.2</td>
        </tr>
        <tr>
          <th>9990</th>
          <td>9991</td>
          <td>2023-03-17</td>
          <td>Standard Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Costa Mesa</td>
          <td>California</td>
          <td>92627</td>
          <td>West</td>
          <td>Furniture</td>
          <td>Furnishings</td>
          <td>FUR-FU-10000747</td>
          <td>70</td>
          <td>90</td>
          <td>2</td>
          <td>4</td>
          <td>3.6</td>
          <td>86.4</td>
          <td>16.4</td>
        </tr>
        <tr>
          <th>9991</th>
          <td>9992</td>
          <td>2022-08-07</td>
          <td>Standard Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Costa Mesa</td>
          <td>California</td>
          <td>92627</td>
          <td>West</td>
          <td>Technology</td>
          <td>Phones</td>
          <td>TEC-PH-10003645</td>
          <td>220</td>
          <td>260</td>
          <td>2</td>
          <td>2</td>
          <td>5.2</td>
          <td>254.8</td>
          <td>34.8</td>
        </tr>
        <tr>
          <th>9992</th>
          <td>9993</td>
          <td>2022-11-19</td>
          <td>Standard Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Costa Mesa</td>
          <td>California</td>
          <td>92627</td>
          <td>West</td>
          <td>Office Supplies</td>
          <td>Paper</td>
          <td>OFF-PA-10004041</td>
          <td>30</td>
          <td>30</td>
          <td>4</td>
          <td>3</td>
          <td>0.9</td>
          <td>29.1</td>
          <td>-0.9</td>
        </tr>
        <tr>
          <th>9993</th>
          <td>9994</td>
          <td>2022-07-17</td>
          <td>Second Class</td>
          <td>Consumer</td>
          <td>United States</td>
          <td>Westminster</td>
          <td>California</td>
          <td>92683</td>
          <td>West</td>
          <td>Office Supplies</td>
          <td>Appliances</td>
          <td>OFF-AP-10002684</td>
          <td>210</td>
          <td>240</td>
          <td>2</td>
          <td>3</td>
          <td>7.2</td>
          <td>232.8</td>
          <td>22.8</td>
        </tr>
      </tbody>
    </table>
    <p>9994 rows × 19 columns</p>
    </div>



.. code:: ipython3

    df['order_date']=pd.to_datetime(df['order_date'], format="%Y-%m-%d")

.. code:: ipython3

    df.dtypes




.. parsed-literal::

    order_id                     int64
    order_date          datetime64[ns]
    ship_mode                   object
    segment                     object
    country                     object
    city                        object
    state                       object
    postal_code                  int64
    region                      object
    category                    object
    sub_category                object
    product_id                  object
    cost_price                   int64
    list_price                   int64
    quantity                     int64
    discount_percent             int64
    discount                   float64
    sale_price                 float64
    profit                     float64
    dtype: object



.. code:: ipython3

    #drop cost price list price and discount percent columns 

.. code:: ipython3

    df.drop(columns=['list_price','cost_price','discount_percent'],inplace = True)

.. code:: ipython3

    import sqlalchemy as sal
        engine = sal.create_engine('mssql://BharadwajMunna/master?driver=ODBC+DRIVER+17+FOR+SQL+SERVER')
        conn=engine.connect()

.. code:: ipython3

    df.to_sql('df_orders',con=conn,index=False,if_exists='append')


