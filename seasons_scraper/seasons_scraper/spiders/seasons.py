import scrapy 

class SeasonSpider(scrapy.Spider):
    name = "seasons"

    def start_requests(self):
        urls = ["https://www.bbcgoodfood.com/seasonal-calendar/all"]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)
    
    def parse(self, response):
        for div in response.css("div.scrollable-section"):
            for table in div.css("tbody"):
                for inside in table.css("tr"):
                    yield {
                        'inside': inside.get()
                    }
                

