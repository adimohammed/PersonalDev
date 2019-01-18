public class ProductPriceBook1 {

    public class productInfo {
    
        public Product2 prod{get; set;}
        public List<PriceBook2> priceBooks {get; Set;}
        public productInfo() {
            priceBooks = new List<PriceBook2>();
        }
        
    }
    
    public List<ProductInfo> products {get; set;}
    
    public ProductPriceBook1() {
        products = new List<productInfo >();
        Map<Id, productInfo> pInfoMap = new Map<Id, productInfo>(); //Map to track Prduct2 records
        for (PricebookEntry pEntry :[Select id, product2Id, product2.Name, product2.Description, product2.Family, product2.ProductCode, pricebook2id, pricebook2.name from PricebookEntry]) {
            ProductInfo pInfo = new ProductInfo();
            //Check to see if the Product2Id is already in the map.  
            //If it is not, create a new ProdutInfo Record
            //If it is, add a new Pricebook2 record to the existing ProductInfo record
            if(!pInfoMap.containsKey(pEntry.product2Id)) {
                pInfo.prod = new Product2(id=pEntry.product2Id, Name=pEntry.product2.Name, Description=pEntry.product2.Description, Family=pEntry.product2.Family, ProductCode=pEntry.product2.ProductCode);
                pInfo.pricebooks.add(new PriceBook2(id=pEntry.pricebook2id, name=pEntry.pricebook2.name));
                pInfoMap.put(pEntry.product2Id, pInfo);
            } else {
                pInfo = pInfoMap.get(pEntry.product2Id);
                pInfo.pricebooks.add(new PriceBook2(id=pEntry.pricebook2id, name=pEntry.pricebook2.name));
            }
        }
        products = pInfoMap.values();
    }
    
}