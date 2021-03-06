.NAME:3: Wetland habitat status mapping (different water body types)
.GROUP:PG#2:Wetland Habitat Mapping
.ALGORITHM:modeler:water mask
.PARAMETERS:{"classidofwater": 1}
.MODE:Normal
.INSTRUCTIONS:<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;">
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">The first step creates a binary water mask from a reclassified map derived from Wetland habitat status mapping (general) workflow. </span><a name="OLE_LINK12"></a><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">T</span><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">he area of water body will have a value of 1, while non-water areas will have a no data value (NA or nan). </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Settings: </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Classification map: Select the classification map derived from Wetland habitat status mapping (general) workflow. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Class ID of water: Specify the Class ID value of water in the classification map. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Water mask: Define the output directory and map name. The output map name can be called 01_Mask</span><a name="OLE_LINK15"></a><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">_</span><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">[‘enter name’].tif</span> </p></body></html>
!INSTRUCTIONS
.ALGORITHM:modeler:feature extraction
.PARAMETERS:{"nirbandnumber": 7, "spatialresolution": 10}
.MODE:Normal
.INSTRUCTIONS:<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;">
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">This step creates vector polygons for all connected regions of water pixels, and calculates spatial statistics for these water polygons, such as shape index, perimeter / square root of the area, and maximum distance / square root of the area. It also calculates standard deviation and sum of pixels values of the NIR band within the water segment polygons. All results are stored as attributes in a new vector layer. The polygonal vector data are then converted to raster data and combined to one single output layer for further analysis. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;"> </span> </p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Settings: </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">water mask: Select the water mask map “01_Mask_[‘enter name’].tif” generated in the previous step. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Surface reflectance: This is the stacked bands of satellite image used for classification. (use the same image as in workflow 1 step 1)</span> </p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">NIR band number: This is the serial number of NIR band. The default is ‘7’ for Sentinel-2 data or ‘4’ for Landsat data. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Spatial resolution (m): The spatial resolution of output raster should be the same as the satellite image used for classification. The default is ‘10’ for Sentinel-2 and  ‘30’ if Landsat data are used. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Output raster: Define the output directory and map name. The output map name can be called 02_Feature_[‘enter name’].tif</span></p></body></html>
!INSTRUCTIONS
.ALGORITHM:r:randomforestclass
.PARAMETERS:{"Number_of_Cores_for_Processing ": 2, "Class_ID_Field": "", "Number_of_Trees ": 500}
.MODE:Normal
.INSTRUCTIONS:<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;">
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">This step performs Random Forest classification by relating the input maps to associated training polygon or point vector data. </span></p>
<p style="-qt-paragraph-type:empty; margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><br /></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Settings: </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Data to be classified: This is the layer stack created from the previous step &quot;02_Feature_[‘enter name’].tif&quot;</span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Training Data: This is the vector training data used to classify the area. This should be a vector polygon or point shape file (.shp) and the projection of this file must be identical to the ‘Data to be classified’. </span> </p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Class ID Field: This is the field name in the training data shapefile attributes that corresponds to the unique class ID. The default is ‘Class’ but change this if the class field name is different in your shapefile. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Note: The value of class ID for water body types should be different from other land cover/use classes in the previous classification (derived from WORKFLOW 2). </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Mask Raster: This is the water mask “01_Mask_[‘enter name’].tif” generated in Step 1. The water body pixels should have a value of 1, while non-water pixels should have a no data value (NA or nan). </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Number of Cores for Processing:  Number of cores used for processing the imagery. The default is 2, but if your computer has more cores available you can increase this for better performance. You can check the number of cores your computer has on Windows by going to Task Manager and under the Performance tab you can see how many cores are available. It’s a good idea to leave at least one core free for other processes. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Number of Decision Trees: Integer - The number of trees used in the random forest. By default, 500 decision trees are used for classification.</span> </p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Output Raster: Define the output directory and image name. The output image name can be called 03_RFC_[‘enter name’].tif</span></p></body></html>
!INSTRUCTIONS
.ALGORITHM:modeler:map combination
.PARAMETERS:{}
.MODE:Normal
.INSTRUCTIONS:<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'MS Shell Dlg 2'; font-size:7.8pt; font-weight:400; font-style:normal;">
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">This step replaces the pixel value of water class in the original classification with the values of different water body types derived in the previous step. </span></p>
<p style="-qt-paragraph-type:empty; margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><br /></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Settings: </span> </p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Classfication A: This is the classification map of different water body types “03_RFC_[‘enter name’].tif” produced in previous step (Step 3). </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Classification B: This is the classification map for other land uses/covers generated from Wetland habitat status mapping (general) workflow. </span></p>
<p style=" margin-top:12px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'Arial,sans-serif'; font-size:9pt;">Combined map: Define the output directory and map name. The output map name can be called 04_Combi_[‘enter name’].tif</span></p></body></html>
!INSTRUCTIONS
