================================================================================
Low Order Price For Zones v1.1                                     2th OCT 2012


[Description]


[Compatibility]
Supports OpenCart Version 1.5.1.3, 1.5.2.1

Author:  Zoom Into Web

================================================================================

--------------------------------------------------------------------------------
[Installation]
--------------------------------------------------------------------------------

		1. Copy 'admin' and 'catalog', 'vqmod' folders into the root folder of your website

		2. The following OpenCart core files need to be changed:

			catalog/controller/checkout/confirm.php

			If you have a pre-installed VQMod (Virtual Modifier) on your OpenCart system 
			then this has already been taken care of by VQMod using the XML script from the
			uploaded 'vqmod' folder. 

			VQMod is available from <http://vqmod.com/>


		Alternatively, if you don't have a pre-installed VQMod, you can change the files manually:

		2.1	In file catalog/controller/checkout/confirm.php find:

				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);

			Replace the following line with found line:			
				
				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes,$payment_address);