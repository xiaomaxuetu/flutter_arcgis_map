package com.panda.flutter_arcgis_map;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.esri.arcgisruntime.ArcGISRuntimeEnvironment;
import com.esri.arcgisruntime.geometry.Envelope;
import com.esri.arcgisruntime.geometry.Point;
import com.esri.arcgisruntime.geometry.Polygon;
import com.esri.arcgisruntime.geometry.SpatialReference;
import com.esri.arcgisruntime.layers.ArcGISMapImageLayer;
import com.esri.arcgisruntime.layers.ArcGISTiledLayer;
import com.esri.arcgisruntime.layers.Layer;
import com.esri.arcgisruntime.mapping.ArcGISMap;
import com.esri.arcgisruntime.mapping.Basemap;
import com.esri.arcgisruntime.mapping.view.MapView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.platform.PlatformView;

public class NativeView implements PlatformView {

    @NonNull private final MapView mapView;
    public List<Layer> mapList = new ArrayList<>();

    NativeView(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
//        textView = new TextView(context);
//        textView.setTextSize(24);
//        textView.setBackgroundColor(Color.rgb(255, 255, 255));
//        textView.setText("Rendered on a native Android view (id: " + id + ")");
        ArcGISRuntimeEnvironment.setLicense(creationParams.get("licenseKey").toString());
        mapView = new MapView(context);
        ArcGISTiledLayer tiledLayer = new ArcGISTiledLayer(creationParams.get("tiledLayerUrl").toString());
        ArcGISMapImageLayer imageLayer = new ArcGISMapImageLayer(creationParams.get("imageLayerUrl").toString());
        mapList.add(tiledLayer);
        mapList.add(imageLayer);
        ArcGISMap map = new ArcGISMap(new Basemap(mapList,null));
        mapView.setMap(map);
        String extent = creationParams.get("extent").toString();
        String[] arr = extent.split(",");
        SpatialReference spatialReference = SpatialReference.create(Integer.parseInt(creationParams.get("wkid").toString()));
        Envelope envelope = new Envelope(Double.parseDouble(arr[0]),
                Double.parseDouble(arr[1]),
                Double.parseDouble(arr[2]),
                Double.parseDouble(arr[3]),spatialReference);



        mapView.setViewpointGeometryAsync(envelope);
    }

    @NonNull
    @Override
    public View getView() {
        return mapView;
    }

    @Override
    public void dispose() {

    }
}
