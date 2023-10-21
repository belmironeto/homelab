func Provider() *schema.Provider {
	return &schema.Provider{
DataSourcesMap: map[string]*schema.Resource{
		"multirouter_package_latest_version": dataLatestMultiRouterPackage(),
		 "multirouter_package_all_versions": dataVersionsMultiRouterPackage(),
},
	}
}