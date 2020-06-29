package serverend;

import java.io.IOException;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonDecoder implements Decoder.Text<Object> {

	private ObjectMapper mapper = new ObjectMapper();

	@Override
	public void init(EndpointConfig coinfig) {
		/*処理なし*/
	}

	@Override
	public Object decode(String message) throws DecodeException {
		try {
			return this.mapper.readValue(message, GetMessage.class);
		} catch (IOException e) {
			throw new DecodeException(message, "failed to decode message", e);
		}
	}

	@Override
	public boolean willDecode(String s) {
		return true;
	}

	@Override public void destroy() {/*no use*/}
}
