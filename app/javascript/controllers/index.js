// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import MapController from "./map_controller"
application.register("map", MapController)

import MapshowController from "./mapshow_controller"
application.register("mapshow", MapController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import GalleryController from "./gallery_controller"
application.register("gallery", GalleryController)

import RegionCitiesController from "./region_cities_controller"
application.register('region-cities', RegionCitiesController)
