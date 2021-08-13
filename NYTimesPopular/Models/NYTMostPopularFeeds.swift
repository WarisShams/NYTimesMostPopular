//
//  NYTMostPopularFeeds.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import Foundation

open class NYTMostPopularFeeds : Serializer {
    
    open var copyright : String!
    open var numResults : Int!
    open var results : [Result]!
    open var status : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    required public init(fromDictionary dictionary: [String:Any]) {
        copyright = dictionary["copyright"] as? String
        numResults = dictionary["num_results"] as? Int
        results = [Result]()
        if let resultsArray = dictionary["results"] as? [[String:Any]] {
            for dic in resultsArray {
                let value = Result(fromDictionary: dic)
                results.append(value)
            }
        }
        status = dictionary["status"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    open func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if copyright != nil {
            dictionary["copyright"] = copyright
        }
        if numResults != nil {
            dictionary["num_results"] = numResults
        }
        if results != nil {
            var dictionaryElements = [[String:Any]]()
            for resultsElement in results {
                dictionaryElements.append(resultsElement.toDictionary())
            }
            dictionary["results"] = dictionaryElements
        }
        if status != nil {
            dictionary["status"] = status
        }
        return dictionary
    }
    
    // MARK: - Result -
    open class Result : Serializer {
        
        open var abstractField : String!
        open var adxKeywords : String!
        open var assetId : Int!
        open var byline : String!
        open var column : Any!
        open var desFacet : [String]!
        open var etaId : Int!
        open var geoFacet : [String]!
        open var id : Int!
        open var media : [Media]!
        open var nytdsection : String!
        open var orgFacet : [String]!
        open var perFacet : [String]!
        open var publishedDate : String!
        open var section : String!
        open var source : String!
        open var subsection : String!
        open var title : String!
        open var type : String!
        open var updated : String!
        open var uri : String!
        open var url : String!
        
        
        /**
         * Instantiate the instance using the passed dictionary values to set the properties values
         */
        required public init(fromDictionary dictionary: [String:Any]) {
            abstractField = dictionary["abstract"] as? String
            adxKeywords = dictionary["adx_keywords"] as? String
            assetId = dictionary["asset_id"] as? Int
            byline = dictionary["byline"] as? String
            column = dictionary["column"]
            desFacet = dictionary["des_facet"] as? [String]
            etaId = dictionary["eta_id"] as? Int
            geoFacet = dictionary["geo_facet"] as? [String]
            id = dictionary["id"] as? Int
            media = [Media]()
            if let mediaArray = dictionary["media"] as? [[String:Any]] {
                for dic in mediaArray {
                    let value = Media(fromDictionary: dic)
                    media.append(value)
                }
            }
            nytdsection = dictionary["nytdsection"] as? String
            orgFacet = dictionary["org_facet"] as? [String]
            perFacet = dictionary["per_facet"] as? [String]
            publishedDate = dictionary["published_date"] as? String
            section = dictionary["section"] as? String
            source = dictionary["source"] as? String
            subsection = dictionary["subsection"] as? String
            title = dictionary["title"] as? String
            type = dictionary["type"] as? String
            updated = dictionary["updated"] as? String
            uri = dictionary["uri"] as? String
            url = dictionary["url"] as? String
        }
        
        /**
         * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
         */
        open func toDictionary() -> [String:Any] {
            var dictionary = [String:Any]()
            if abstractField != nil {
                dictionary["abstract"] = abstractField
            }
            if adxKeywords != nil {
                dictionary["adx_keywords"] = adxKeywords
            }
            if assetId != nil {
                dictionary["asset_id"] = assetId
            }
            if byline != nil {
                dictionary["byline"] = byline
            }
            if column != nil {
                dictionary["column"] = column
            }
            if desFacet != nil {
                dictionary["des_facet"] = desFacet
            }
            if etaId != nil {
                dictionary["eta_id"] = etaId
            }
            if geoFacet != nil {
                dictionary["geo_facet"] = geoFacet
            }
            if id != nil {
                dictionary["id"] = id
            }
            if media != nil {
                var dictionaryElements = [[String:Any]]()
                for mediaElement in media {
                    dictionaryElements.append(mediaElement.toDictionary())
                }
                dictionary["media"] = dictionaryElements
            }
            if nytdsection != nil {
                dictionary["nytdsection"] = nytdsection
            }
            if orgFacet != nil {
                dictionary["org_facet"] = orgFacet
            }
            if perFacet != nil {
                dictionary["per_facet"] = perFacet
            }
            if publishedDate != nil {
                dictionary["published_date"] = publishedDate
            }
            if section != nil {
                dictionary["section"] = section
            }
            if source != nil {
                dictionary["source"] = source
            }
            if subsection != nil {
                dictionary["subsection"] = subsection
            }
            if title != nil {
                dictionary["title"] = title
            }
            if type != nil {
                dictionary["type"] = type
            }
            if updated != nil {
                dictionary["updated"] = updated
            }
            if uri != nil {
                dictionary["uri"] = uri
            }
            if url != nil {
                dictionary["url"] = url
            }
            return dictionary
        }
        
        // MARK: - Media -
        open class Media : Serializer {
            
            open var approvedForSyndication : Int!
            open var caption : String!
            open var copyright : String!
            open var mediametadata : [MediaMetadata]!
            open var subtype : String!
            open var type : String!
            
            
            /**
             * Instantiate the instance using the passed dictionary values to set the properties values
             */
            required public init(fromDictionary dictionary: [String:Any]) {
                approvedForSyndication = dictionary["approved_for_syndication"] as? Int
                caption = dictionary["caption"] as? String
                copyright = dictionary["copyright"] as? String
                mediametadata = [MediaMetadata]()
                if let mediametadataArray = dictionary["media-metadata"] as? [[String:Any]] {
                    for dic in mediametadataArray {
                        let value = MediaMetadata(fromDictionary: dic)
                        mediametadata.append(value)
                    }
                }
                subtype = dictionary["subtype"] as? String
                type = dictionary["type"] as? String
            }
            
            /**
             * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
             */
            open func toDictionary() -> [String:Any] {
                var dictionary = [String:Any]()
                if approvedForSyndication != nil {
                    dictionary["approved_for_syndication"] = approvedForSyndication
                }
                if caption != nil {
                    dictionary["caption"] = caption
                }
                if copyright != nil {
                    dictionary["copyright"] = copyright
                }
                if mediametadata != nil {
                    var dictionaryElements = [[String:Any]]()
                    for mediametadataElement in mediametadata {
                        dictionaryElements.append(mediametadataElement.toDictionary())
                    }
                    dictionary["media-metadata"] = dictionaryElements
                }
                if subtype != nil {
                    dictionary["subtype"] = subtype
                }
                if type != nil {
                    dictionary["type"] = type
                }
                return dictionary
            }
            
            // MARK: - MediaMetadata -
            open class MediaMetadata : Serializer {
                
                open var format : String!
                open var height : Int!
                open var url : String!
                open var width : Int!
                
                
                /**
                 * Instantiate the instance using the passed dictionary values to set the properties values
                 */
                required public init(fromDictionary dictionary: [String:Any]) {
                    format = dictionary["format"] as? String
                    height = dictionary["height"] as? Int
                    url = dictionary["url"] as? String
                    width = dictionary["width"] as? Int
                }
                
                /**
                 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
                 */
                open func toDictionary() -> [String:Any] {
                    var dictionary = [String:Any]()
                    if format != nil {
                        dictionary["format"] = format
                    }
                    if height != nil {
                        dictionary["height"] = height
                    }
                    if url != nil {
                        dictionary["url"] = url
                    }
                    if width != nil {
                        dictionary["width"] = width
                    }
                    return dictionary
                }
                
            }//End of MediaMetadata
            
        }//End of Media
        
    }//End of Result
    
}//End of File
