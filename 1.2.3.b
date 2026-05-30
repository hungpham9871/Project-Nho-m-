{
  "metadata": {
    "language_info": {
      "name": "R",
      "codemirror_mode": "r",
      "pygments_lexer": "r",
      "mimetype": "text/x-r-source",
      "file_extension": ".r",
      "version": "3.6.3"
    },
    "kernelspec": {
      "name": "ir",
      "display_name": "R",
      "language": "R"
    },
    "colab": {
      "name": "EDA Online Retail ",
      "provenance": [],
      "include_colab_link": true
    }
  },
  "nbformat_minor": 0,
  "nbformat": 4,
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/hungpham9871/Project-Nho-m-/blob/main/1.2.3.b\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "source": [
        "\n",
        "# IMPORTANT: RUN THIS CELL IN ORDER TO IMPORT YOUR KAGGLE DATA SOURCES\n",
        "# TO THE CORRECT LOCATION (/kaggle/input) IN YOUR NOTEBOOK,\n",
        "# THEN FEEL FREE TO DELETE THIS CELL.\n",
        "# NOTE: THIS NOTEBOOK ENVIRONMENT DIFFERS FROM KAGGLE'S R\n",
        "# ENVIRONMENT SO THERE MAY BE MISSING LIBRARIES USED BY YOUR\n",
        "# NOTEBOOK.\n",
        "\n",
        "DATA_SOURCE_MAPPING = 'online-retail:https%3A%2F%2Fstorage.googleapis.com%2Fkaggle-data-sets%2F1283855%2F2139706%2Fbundle%2Farchive.zip%3FX-Goog-Algorithm%3DGOOG4-RSA-SHA256%26X-Goog-Credential%3Dgcp-kaggle-com%2540kaggle-161607.iam.gserviceaccount.com%252F20260530%252Fauto%252Fstorage%252Fgoog4_request%26X-Goog-Date%3D20260530T025343Z%26X-Goog-Expires%3D259200%26X-Goog-SignedHeaders%3Dhost%26X-Goog-Signature%3Db8840e91a1037c6c011063098b0ceb8c91b3d697eed91b4f80c1cf491f76a7d24c5ed237167e8c8242c16db4b9e46e1e9fd621c73c2b7a877d2d39f36765035ff3a071b5896fafb71bc9bdc1c874d3ebca7c279d7d12402187b0efada1e571d35079c549b01d018897187a58672d522a495e9abcd67b1d2b7f3856e1a09d00df1e3f5d688624418bf8d71e4cd369a742b519a145b2e9c1fa697eb7f2a84d61fd85b671582d1c5b155a2a0c802ff1586f156a2755d1db22a0aef312054170c441c4678f2ec1bd00e5375fb5194a35820ee46b332155d20b5c03c588c5b56d5659581a0b5b317ff551949db57a6c7290c180ca8104b30bf18374026b7aa7e94949'\n",
        "\n",
        "KAGGLE_INPUT_PATH = '/kaggle/input'\n",
        "KAGGLE_WORKING_PATH = '/kaggle/working'\n",
        "\n",
        "system(paste0('sudo umount ', '/kaggle/input'))\n",
        "system(paste0('sudo rmdir ', '/kaggle/input'))\n",
        "system(paste0('sudo mkdir -p -- ', KAGGLE_INPUT_PATH), intern=TRUE)\n",
        "system(paste0('sudo chmod 777 ', KAGGLE_INPUT_PATH), intern=TRUE)\n",
        "system(\n",
        "  paste0('sudo ln -sfn ', KAGGLE_INPUT_PATH,' ',file.path('..', 'input')),\n",
        "  intern=TRUE)\n",
        "\n",
        "system(paste0('sudo mkdir -p -- ', KAGGLE_WORKING_PATH), intern=TRUE)\n",
        "system(paste0('sudo chmod 777 ', KAGGLE_WORKING_PATH), intern=TRUE)\n",
        "system(\n",
        "  paste0('sudo ln -sfn ', KAGGLE_WORKING_PATH, ' ', file.path('..', 'working')),\n",
        "  intern=TRUE)\n",
        "\n",
        "data_source_mappings = strsplit(DATA_SOURCE_MAPPING, ',')[[1]]\n",
        "for (data_source_mapping in data_source_mappings) {\n",
        "    path_and_url = strsplit(data_source_mapping, ':')\n",
        "    directory = path_and_url[[1]][1]\n",
        "    download_url = URLdecode(path_and_url[[1]][2])\n",
        "    filename = sub(\"\\\\?.+\", \"\", download_url)\n",
        "    destination_path = file.path(KAGGLE_INPUT_PATH, directory)\n",
        "    print(paste0('Downloading and uncompressing: ', directory))\n",
        "    if (endsWith(filename, '.zip')){\n",
        "      temp = tempfile(fileext = '.zip')\n",
        "      download.file(download_url, temp)\n",
        "      unzip(temp, overwrite = TRUE, exdir = destination_path)\n",
        "      unlink(temp)\n",
        "    }\n",
        "    else{\n",
        "      temp = tempfile(fileext = '.tar')\n",
        "      download.file(download_url, temp)\n",
        "      untar(temp, exdir = destination_path)\n",
        "      unlink(temp)\n",
        "    }\n",
        "    print(paste0('Downloaded and uncompressed: ', directory))\n",
        "}\n",
        "\n",
        "print(paste0('Data source import complete'))\n"
      ],
      "metadata": {
        "id": "ZGro2JEWzVWR",
        "outputId": "a5d60684-f943-4b91-9c6d-5fe05edded54",
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 69
        }
      },
      "cell_type": "code",
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "display_data",
          "data": {
            "text/html": [],
            "text/markdown": "",
            "text/latex": "",
            "text/plain": [
              "character(0)"
            ]
          },
          "metadata": {}
        },
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "[1] \"Downloading and uncompressing: online-retail\"\n",
            "[1] \"Downloaded and uncompressed: online-retail\"\n",
            "[1] \"Data source import complete\"\n"
          ]
        }
      ],
      "execution_count": 1
    },
    {
      "cell_type": "code",
      "source": [
        "install.packages(\"ggplot2\")\n",
        "library(ggplot2)\n",
        "install.packages(\"readxl\")\n",
        "library(\"readxl\")\n",
        "library(magrittr)\n",
        "install.packages(\"dplyr\")\n",
        "library(dplyr)\n",
        "install.packages(\"reshape2\")\n",
        "library(reshape2)\n",
        "install.packages(\"plotly\")\n",
        "library(plotly)\n",
        "install.packages(\"tidyr\")\n",
        "library(\"tidyr\")"
      ],
      "metadata": {
        "_uuid": "c6201e76-7c51-450a-ad2f-467b9cf81e52",
        "_cell_guid": "64908f73-ccc3-4eda-abab-2ed4689b22ba",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "EP8iagIlzVWV",
        "outputId": "bb445839-c9d7-4b5a-a2c2-ed24d3425438",
        "colab": {
          "base_uri": "https://localhost:8080/"
        }
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n",
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n",
            "Installing package into ‘/usr/local/lib/R/site-library’\n",
            "(as ‘lib’ is unspecified)\n",
            "\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "df=read_excel(\"../input/online-retail/Online Retail.xlsx\")"
      ],
      "metadata": {
        "_uuid": "f9684564-ccf0-4660-9b0b-1f021e9220a0",
        "_cell_guid": "69398a2e-d3a8-401b-804c-d7ab252d1466",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "V7fGV1ADzVWW"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "head(df,10)"
      ],
      "metadata": {
        "_uuid": "c01bc98c-715e-489a-8573-62d91bc98040",
        "_cell_guid": "1522cfa7-2b78-4bf5-b52f-cbf1394b22d4",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "MXEEfHAwzVWW"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "df=df[, c('CustomerID','InvoiceNo','StockCode','Quantity','UnitPrice','Description','InvoiceDate','Country')]\n",
        "head(df)"
      ],
      "metadata": {
        "_uuid": "f9ade594-2c17-4e0e-9b7c-e6a13bc399a3",
        "_cell_guid": "7602fb1a-6b52-414f-8617-65ba9a94bd79",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "4sd2ljrAzVWX"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "summary(df)"
      ],
      "metadata": {
        "_uuid": "4b01b353-a931-4404-bf24-9d2d4358c042",
        "_cell_guid": "e7b8b1af-6ac8-42f6-99d6-f297e15d4047",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "PDEZXd55zVWX"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "str(df)"
      ],
      "metadata": {
        "_uuid": "67b534e4-d146-46a7-8564-a2951460fcf3",
        "_cell_guid": "d7af2f93-86c7-4773-81cb-dd9549a6216e",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "yCYMGM0izVWX"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "nrow(df)\n",
        "ncol(df)"
      ],
      "metadata": {
        "_uuid": "2a397eea-870b-41f6-b55e-1d2d8ffad179",
        "_cell_guid": "d27d1831-877d-4d83-a893-ccfddd6d53f0",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "HmaRye1IzVWY"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "colSums(is.na(df))"
      ],
      "metadata": {
        "_uuid": "a30461cf-8a55-4e92-bf49-e5d1db2183d9",
        "_cell_guid": "fd5537ac-6762-4751-837d-6983744205a7",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "FKmLwzW9zVWY"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "country=df$Country\n",
        "country[!duplicated(country)]"
      ],
      "metadata": {
        "_uuid": "4eb7d75c-70ff-4a0b-8827-50e2f0299a70",
        "_cell_guid": "d766d533-e47c-4764-ab9d-2d82aa32cd62",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "M-j71qlZzVWY"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "TotalAmount = df$Quantity * df$UnitPrice\n",
        "df$TotalAmount <- TotalAmount"
      ],
      "metadata": {
        "_uuid": "069f2c7d-b665-49ee-b64e-a418bc85290a",
        "_cell_guid": "8a4fb16e-3a6d-44d5-8f06-5280f130af3f",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "GHmsHDOVzVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "new_df = df[,c('CustomerID','InvoiceNo','StockCode','Quantity','TotalAmount','InvoiceDate','Country')]\n",
        "\n",
        "new_df2 = df\n",
        "tracemem(new_df2)==tracemem(df)"
      ],
      "metadata": {
        "_uuid": "b3fcc449-b36c-45f6-9d2e-4a88791b7591",
        "_cell_guid": "4b549f58-6238-4ad2-be0c-9ebdf5205219",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "7I3r9ykizVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "head(new_df)"
      ],
      "metadata": {
        "_uuid": "292b1571-7264-4a8f-8f18-5b3a68e5078e",
        "_cell_guid": "79895717-d36b-4ad9-85ba-f32590051277",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "jr67H6x3zVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Grouping countries by TotalAmount of sales\n",
        "\n",
        "country_price = new_df %>%\n",
        "  group_by(Country) %>%\n",
        "  summarise(Quantity = sum(Quantity))\n",
        "\n",
        "country_price = country_price[order(-country_price$Quantity),]\n",
        "country_price"
      ],
      "metadata": {
        "_uuid": "1ff28568-1aec-4300-92b9-b7d105cc56cd",
        "_cell_guid": "684a3050-3f2b-4b56-9a6e-af0b9bfca654",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "risH3QnQzVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Top 5 Companies with high number of purchase\n",
        "\n",
        "bp_country_top=country_price$Country[1:5]\n",
        "bp_quantity_top=country_price$Quantity[1:5]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_quantity_top, names=bp_country_top, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "55999747-b5e9-47b0-9f00-f9a16c2cbe64",
        "_cell_guid": "dbfa45a8-65c2-4697-863c-dba7d336d25d",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "FvHMOrIFzVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# 5 Companies with least number of purchase\n",
        "\n",
        "bp_country_low=country_price$Country[34:38]\n",
        "bp_quantity_low=country_price$Quantity[34:38]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_quantity_low, names=bp_country_low, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "e2d9b14b-7326-4c5f-bd52-78dedb121899",
        "_cell_guid": "94a09709-00ff-4332-8b5c-d446bd412f22",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "u4LAcLptzVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Adding year feature to the dataset\n",
        "\n",
        "timest <- as.POSIXct(new_df$InvoiceDate, format = \"%m/%d/%Y %H:%M:%S\")\n",
        "timest=format(timest, format=\"%Y\")\n",
        "new_df$Year = timest\n",
        "\n",
        "head(new_df)"
      ],
      "metadata": {
        "_uuid": "d28c52b1-aeb1-4a3d-af70-71e87a785cb2",
        "_cell_guid": "52bc105e-6cc1-43af-ac7a-2f5f4edbba2c",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "Cn0h6hP1zVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Plot of Total Amount of sale vs Year\n",
        "\n",
        "year_ttlamount = new_df %>%\n",
        "  group_by(Year) %>%\n",
        "  summarise(TotalAmount = sum(TotalAmount))\n",
        "\n",
        "bp_yearttl_Year=year_ttlamount$Year\n",
        "bp_yearttl_TotalAmount=year_ttlamount$TotalAmount\n",
        "par(mar=c(2, 5, 0, 0))\n",
        "barplot(height=bp_yearttl_TotalAmount, names=bp_yearttl_Year, col=\"#69b3a2\")"
      ],
      "metadata": {
        "_uuid": "263c9990-cd17-41d0-997a-3e1dee43a5d7",
        "_cell_guid": "56567b4a-8ca5-4de5-816b-ac6246d1deb1",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "Ga0BlVzdzVWZ"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "head(new_df)"
      ],
      "metadata": {
        "_uuid": "8bb3c7b4-3050-42b6-8913-1ec0630f5ff3",
        "_cell_guid": "fe4ee89f-9291-4e46-b42d-54b7efad8b53",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "Khyddof8zVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "new_df=new_df %>% drop_na()\n",
        "colSums(is.na(new_df))"
      ],
      "metadata": {
        "_uuid": "bd6bf35b-f48e-4313-bfbd-ce183c9fe7e1",
        "_cell_guid": "a4dd6185-12ae-4163-9cab-d6a231f07e50",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "U42lp0FDzVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Group by Number of Customers in a Country\n",
        "\n",
        "cus_id = new_df %>%\n",
        "  group_by(Country) %>%\n",
        "  summarise(CustomerID = sum(CustomerID))\n",
        "\n",
        "cus_id = cus_id[order(-cus_id$CustomerID),]\n",
        "cus_id"
      ],
      "metadata": {
        "_uuid": "e72a4a10-4b84-4b48-977d-a0ffe0bfbaa2",
        "_cell_guid": "9af141c9-f3aa-448f-9f75-89626b8889dd",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "2Vu15D0wzVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# 5 Countries with most number of Customers\n",
        "\n",
        "bp_custid_Country_top=cus_id$Country[1:5]\n",
        "bp_custid_CustomerID_top=cus_id$CustomerID[1:5]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_custid_CustomerID_top, names=bp_custid_Country_top, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "a67dc9de-e861-4cdc-9db7-2fe3334666e7",
        "_cell_guid": "8f1978fc-e82e-430d-a1ec-235c6c91d799",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "VAK_syMtzVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# 5 Countries with least number of Customers\n",
        "\n",
        "bp_custid_Country_low=cus_id$Country[33:37]\n",
        "bp_custid_CustomerID_low=cus_id$CustomerID[33:37]\n",
        "par(mar=c(2, 10, 0, 0))\n",
        "barplot(height=bp_custid_CustomerID_low, names=bp_custid_Country_low, col=\"#69b3a2\", horiz=T , las=1)"
      ],
      "metadata": {
        "_uuid": "8919c98e-a4d8-4147-af38-0ea8ec4c77a9",
        "_cell_guid": "7263bd19-9227-4242-8c5a-3bcecaf9e943",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "jz2S4PdMzVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "new_df2=new_df2 %>% drop_na()\n",
        "colSums(is.na(new_df))"
      ],
      "metadata": {
        "_uuid": "3358f81b-833e-47f2-aceb-381c4f81c265",
        "_cell_guid": "73aede12-feb6-4334-963e-fbb9fdec5e68",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "nc0DPBWCzVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "head(new_df2)"
      ],
      "metadata": {
        "_uuid": "d5166985-3c14-4116-92a1-950224bf868a",
        "_cell_guid": "214a564a-154b-4d9f-a609-96fb4877a084",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "8K_a8tNezVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "# Sales Average of each product\n",
        "\n",
        "avg_sales = new_df2 %>%\n",
        "  group_by(StockCode,Description) %>%\n",
        "  summarise(TotalAmount = mean(TotalAmount),Quantity = mean(Quantity))\n",
        "avg_sales = avg_sales[order(-avg_sales$Quantity),]\n",
        "avg_sales"
      ],
      "metadata": {
        "_uuid": "548eb02f-101f-49db-baac-24d44b974ba8",
        "_cell_guid": "a6c5e0ef-077c-4231-b8f7-110fbf7926c2",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "BKIa0e9AzVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [],
      "metadata": {
        "_uuid": "f3a360d7-2bd3-4a98-9d5b-27d8a2f16d00",
        "_cell_guid": "72e23144-dfee-4857-96e7-c2c1a851214d",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "-3ma8yrBzVWa"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [],
      "metadata": {
        "_uuid": "f7b9852c-9074-45b3-b6c7-d38f457febe8",
        "_cell_guid": "46d8b0f9-85a3-475d-a5ec-a20340047970",
        "jupyter": {
          "outputs_hidden": false
        },
        "trusted": true,
        "id": "jLUCkh9kzVWb"
      },
      "execution_count": null,
      "outputs": []
    }
  ]
}