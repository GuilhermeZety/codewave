'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "d54300e12820f3e9db537130a07d15b0",
"index.html": "06ac884293b3e468c3823f84b1645612",
"/": "06ac884293b3e468c3823f84b1645612",
"main.dart.js": "1f50d1523494956e352c5ca6cb5bb469",
"flutter.js": "4af2b91eb221b73845365e1302528f07",
"favicon.png": "364b5da9ebee6969359531fea9177ac9",
"icons/Icon-192.png": "3691284d57697921f8ee477643ba68f4",
"icons/Icon-maskable-192.png": "3691284d57697921f8ee477643ba68f4",
"icons/Icon-maskable-512.png": "67dbad9c476fde53dd6c95b2d5281624",
"icons/Icon-512.png": "67dbad9c476fde53dd6c95b2d5281624",
"manifest.json": "bf11d4d330040e3a288049b04a435444",
"assets/AssetManifest.json": "d6d273ba7e0dbdac3badd426cd9c4c64",
"assets/NOTICES": "1f3dd98b9505716fee87dedd98dfda7b",
"assets/FontManifest.json": "7e0f289e5cb90e7031759cc0545332a1",
"assets/AssetManifest.bin.json": "f4ceef28dcd8114b4400f8b077897b1d",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "83c878235f9c448928034fe5bcba1c8a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "53553cd9e6e6c2cea14ce292618ee2b2",
"assets/fonts/MaterialIcons-Regular.otf": "a6cdbf71bf5d0b610cdfab63b96ea081",
"assets/assets/decoration_6.svg": "df5ab6f6a69131ca14d4a69955d387d9",
"assets/assets/decoration_4.svg": "c6f8054cce5e5054ebdbc0374ea1967f",
"assets/assets/decoration_5.svg": "8de3f85bd3d1fb5fad5f399f33da2588",
"assets/assets/decoration_1.svg": "1096d710eaf2ec598bde59b738a3c83f",
"assets/assets/github.svg": "28c7b37282beaf2289014e086a48d2e8",
"assets/assets/line_r.svg": "67f1902f781068dc6fb078223ee4908d",
"assets/assets/decoration_2.svg": "8e5f081b36dfe49b4f137c526813c746",
"assets/assets/images/long_logo.png": "e7db2667db13c7fc8ceddcc312c86268",
"assets/assets/images/mac_frame.png": "47ab9e4d97c8876e7ff92b77d8d86d43",
"assets/assets/instagram.svg": "8a135e12f1583a17e0e69b5261f64a4d",
"assets/assets/team.svg": "538b124076298d7e031512f35f60e781",
"assets/assets/water_layer_2.svg": "72dea843206abd7efbed642a5389eadb",
"assets/assets/whatsapp.svg": "3adde52f4381a9f4cd6397af49dffa92",
"assets/assets/water_layer_3.svg": "9245aadc05fac71760a6fca1615a83e6",
"assets/assets/water_layer_1.svg": "6c2ca90582d93ca8e6ad936a5b747eb5",
"assets/assets/linkedin.svg": "c9bf6cbc6fea52dd2763f2c0c612f3a2",
"assets/assets/fonts/SegoeUI-SemiBold.ttf": "a761b4729db027f2204334a55621157a",
"assets/assets/fonts/SegoeUI-Light.ttf": "ec0d28685c3f824a6229676557cef8a5",
"assets/assets/fonts/SegoeUI-Bold.ttf": "f799a572592ea726e4498b7f919f474a",
"assets/assets/fonts/SegoeUI.ttf": "61bb848e77fd1ad14c8fbe4853a198fd",
"assets/assets/line_l.svg": "d9a6693abbd32438a5bdd7ea56c07d0b",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "3a3f8673782d19b3a5935ae795e1eada",
"canvaskit/canvaskit.js.symbols": "ea38a11e0cd06bd815b83dcb9f9aaa5c",
"canvaskit/skwasm.wasm": "45283f64148328e0aa69abe648db5f2a",
"canvaskit/chromium/canvaskit.js.symbols": "bf65c4152b4e4a2ca4915cbc3ff32678",
"canvaskit/chromium/canvaskit.js": "2f82009588e8a72043db753d360d488f",
"canvaskit/chromium/canvaskit.wasm": "12b9d9d6c9b96bd281170b910b21cf67",
"canvaskit/canvaskit.js": "7737f5fc722b6a040ac15271ea8d92fb",
"canvaskit/canvaskit.wasm": "e57868eee1d9a50a9b2d0c9d91dd53c6",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
